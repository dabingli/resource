class Api::V1::ProductsController < Api::V1::BaseController
  before_action :parse_pager_params, only: [:index]
  before_action :parse_is_validate, only: [:index, :show]
  before_action :parse_products_filters, only: [:index]
  before_action :parse_warehouse, only: [:index]
  before_action :validate_sort_by, only: [:index]

  # 商品详情接口要返回的产品属性
  # 无可靠的方法获取每个分类的有效属性，因此对任何商品都返回所有属性
  PRODUCT_FIELDS = (Product.column_names - ['id', 'product_category_id', 'root_product_category_id']).sort

  # 有多语言版本的字段
  INTERNATIONAL_FIELDS = ['name', 'description', 'brand']

  # 价格逻辑：
  # 有无价格都返回商品（按价格筛选时除外），没有的价格返回 nil

  # get /products
  # 获取商品列表
  def index
    fields = [
      'skus.id',
      'skus.level',
      'products.product_no',
      "#{locale_table}.name",
      "#{locale_table}.brand",
      'products.spec',
      'product_categories.id AS product_category_id',
      "product_categories.#{locale_field_prefix}name AS product_category_name",
      "product_use_places.#{locale_field_prefix}name AS use_place",
      "#{price_field} AS price",
      "base_units.#{locale_field_prefix}name AS base_unit",
      "product_id",
    ]

    query = Sku.joins(:site_skus).
      joins(product: [:product_category]).
      joins('LEFT JOIN product_use_places ON product_use_places.id = products.product_use_place_id').
      joins('LEFT JOIN base_units ON base_units.id = products.base_unit_id').
      where({
        'site_skus.site_id' => @site.id,
      })

    unless I18n.chinese?
      query = query.joins(product: [:product_languages]).
                    where('product_languages.language_id' => @language.id)
    end

    # 关联价格表
    if @site.domestic?
      # 未登录使用面价
      if @user_type == :visitor
        # Rails 4.2 没有 left_joins 方法
        # query = query.left_joins(:face_price)
        query = query.joins('LEFT JOIN face_prices ON face_prices.sku_id = skus.id')
      # 登录使用仓库价
      else
        fields << "warehouses.name AS warehouse"
        # 必须把筛选条件放在 ON 中，这样才能达到 left join 的效果
        join_clause = <<-SQL.squish
          LEFT JOIN domestic_prices ON
            domestic_prices.sku_id = skus.id
            AND
            domestic_prices.site_id = #{@site.id}
        SQL

        if @warehouse_id
          join_clause << " AND domestic_prices.warehouse_id = #{warehouse_id}"
        end
        join_clause << " LEFT JOIN warehouses ON warehouses.id = domestic_prices.warehouse_id"
        query = query.joins(join_clause)
      end
    else
      join_clause = <<-SQL.squish
        LEFT JOIN export_prices ON
          export_prices.sku_id = skus.id
          AND
          (export_prices.price_unit_id = 2 OR export_prices.price_unit_id IS NULL)
        LEFT JOIN price_units ON price_units.id = export_prices.price_unit_id
      SQL
      query = query.joins(join_clause)
      fields << "price_units.#{locale_field_prefix}name AS price_unit"
    end

    # 搜索关键字
    if @filter[:search]
      query = query.where(
        "#{locale_table}.name LIKE ? OR products.product_no LIKE ?",
        "%#{@filter[:search]}%",
        "%#{@filter[:search]}%"
       )
    end

    # 其它筛选条件
    query = query.where(products: @filter[:products]) unless @filter[:products].blank?

    # 价格
    if @filter[:min_price] || @filter[:max_price]
      price_range = (@filter[:min_price] || -Float::INFINITY)...(@filter[:max_price] || Float::INFINITY)
      query = query.where("#{price_field}" => price_range)
    end

    total_count = query.count

    records = query.select(fields).
                    order(@order_param).
                    limit(@pager_limit).
                    offset(@pager_offset)

    records = records.map do |record|
      record.attributes.except('id', 'base_unit').merge!({
        'sku_id' => record.id,
        'price_unit' => record.try(:price_unit) || record.base_unit,
        'picture' => record.front_view_image,
        'price' => format_price(record.price),
      })
    end

    r_json :ok, {
      total_count: total_count,
      current_filters: @current_filters,
      filters: available_filters(query),
      products: records,
    }
  end

  # 获取商品详情
  # 同一宝贝中的其它商品也一并返回
  # 使用 sku_id 而非商品 id
  # GET /products/:sku_id
  def show
    sku = Sku.joins(:site_skus).where({
        'site_skus.site_id' => @site.id,
        'skus.id' => params[:sku_id],
      }).first
    if sku.nil?
      return r_json :record_not_found
    end

    # CMS 系统需要返回单条数据
    if params[:single] == '1'
      result = sku_detail sku
      if result
        return r_json :ok, result
      else
        return r_json :record_not_found
      end
    end

    baby_no = BabyManagement.select(:baby_no).find_by(sku_id: sku.id)&.baby_no
    if baby_no
      skus = Sku.joins(:site_skus).
              joins(:baby_management).
              includes(product: [:product_category]).
              where({
                'site_skus.site_id' => @site.id,
                'baby_managements.baby_no' => baby_no,
              })
    else
      skus = [sku]
    end

    result = skus.map do |sku|
      sku_detail(sku)
    end.reject {|item| item.nil?}

    if result.blank? || !result.any? { |item| item[:sku_id] == sku.id }
      return r_json :record_not_found
    else
      r_json :ok, result
    end
  end

  private

  # 解析、设置排序参数
  def validate_sort_by
    sort_by = params[:sort_by].presence&.downcase

    if sort_by.nil?
      @order_param = 'products.updated_at DESC'
      return
    end

    if /^(\w+)(?::(asc|desc))?$/ =~ sort_by
      field = $1
      direction = $2&.upcase || 'ASC'
      case field
      when 'sku_id'
        @order_param = "skus.id #{direction}"
      when 'product_no'
        @order_param = "products.#{field} #{direction}, skus.level #{direction}"
      when 'name'
        @order_param = "#{locale_table}.name #{direction}, skus.level #{direction}"
      when 'spec', 'created_at', 'updated_at'
        @order_param = "products.#{field} #{direction}"
      when 'price'
        @order_param = "#{price_field} #{direction}"
      else
        r_json :wrong_parameter, "Unsupported sort_by field: #{field}"
      end
    else
      r_json :wrong_parameter, "Unrecognized sort_by: #{sort_by}"
    end
  end

  def sku_detail(sku)
    if I18n.chinese?
      locale_record = nil
    else
      locale_record = ProductLanguage.find_by(product_id: sku.product_id, language_id: @language.id)
    end

    item = {
      sku_id: sku.id,
      name: locale_record&.name || sku.product.name,
      product_no: sku.product.product_no,
      level: sku.level,
      product_category_id: sku.product.product_category.id,
      product_category_name: sku.product.product_category.send("#{locale_field_prefix}name"),
      pictures: sku.images,
      created_at: sku.product.created_at,
      updated_at: sku.product.updated_at,
      problem: get_parents(sku.product.product_category.id, "problem"),
      guide: get_parents(sku.product.product_category.id, "guide"),
    }

    item[:product_id] = sku.product_id if params[:site_code] == 'ezz168'
    
    # 设置价格
    if @site.domestic?
      item[:price_unit] = sku.product.base_unit&.send "#{locale_field_prefix}name"

      # 面价
      face_price = sku.face_price&.price
      face_price = format_price(face_price)

      item[:face_price] = face_price

      price_records = DomesticPrice.
          select([
            :nomember_price,
            :member_price,
            'warehouses.name AS warehouse_name',
          ]).
          joins(:warehouse).
          where({
            site_id: @site.id,
            sku_id: sku.id,
          })

      item[:warehouses] = price_records.map do |record|
        case @user_type
        when :member
          {
            warehouse: record.warehouse_name,
            nomember_price: format_price(record.nomember_price),
            member_price: format_price(record.member_price),
          }
        when :not_member
          {
            warehouse: record.warehouse_name,
            nomember_price: format_price(record.nomember_price),
          }
        else
          {
            warehouse: record.warehouse_name,
          }
        end
      end
    else
      record = ExportPrice.where('price_unit_id = 2 OR price_unit_id IS NULL').
                           find_by(sku_id: sku.id)
      if record.nil?
        record = ExportPrice.new
      end

      if !record.new_record? && record.price_unit
        item[:price_unit] = record.price_unit.send "#{locale_field_prefix}name"
      else
        item[:price_unit] = sku.product&.base_unit&.send "#{locale_field_prefix}name"
      end

      item[:face_price] = record.price
      case @user_type
      when :member
        item[:member_price] = record.member_price
        item[:nomember_price] = record.nomember_price
      when :not_member
        item[:nomember_price] = record.nomember_price
      end
    end

    # 产品属性
    PRODUCT_FIELDS.each do |field_name|
      next if item.key?(field_name.to_sym)
      if field_name.end_with? '_id'
        key = field_name[0...-3].to_sym
        unless sku.product[field_name].nil?
          model = key.to_s.classify.constantize
          field = "#{locale_field_prefix}name"
          field = 'name' unless model.column_names.include?(field)
          value = model.select("#{field} AS name").where(id: sku.product[field_name]).first&.name
          item[key] = value unless value.blank?
        end
      else
        key = field_name.to_sym
        if locale_record && locale_record.respond_to?(field_name)
          value = locale_record.send field_name
        else
          value = sku.product[field_name]
        end
        item[key] = value unless value.blank?
      end
    end

    item
  end

  def face_price_field
    if @site.domestic?
      'face_prices.price'
    else
      'export_prices.price'
    end
  end

  def format_price(price)
    price.to_f <= 0 ? nil : price
  end

  def locale_table
    I18n.chinese? ? 'products' : 'product_languages'
  end

  def price_field
    if @user_type == :visitor
      face_price_field
    else
      table = @site.domestic? ? 'domestic_prices' : 'export_prices'
      field = @user_type == :member ? 'member_price' : 'nomember_price'
      "#{table}.#{field}"
    end
  end

  # 返回可用的筛选条件，及每个条件的可选值
  def available_filters(query)
    # 没有分类时不能筛选
    return [] if params[:product_category_id].blank?
    return [] if query.count == 0

    category = ProductCategory.find_by id: params[:product_category_id]

    # 已经传递的筛选条件不再返回
    filters = category.available_filters.select do |field_name, options|
      if field_name == 'product_category_id'
        category.children.count > 0
      else
        @filter[:products][field_name.to_sym].blank?
      end
    end

    filter_values = category.available_filter_values(query, filters)

    filter_values.reject { |filter| filter[:values].blank? }
  end

  #查找父级id
  def get_parents(id,category)
    @items = {}

    problem = category.classify.constantize.find_by(product_category_id: id)
    product_category = ProductCategory.find(id)
    @items = problem.try(:solution)
    
    get_parents(product_category.parent_id, category) if !product_category.parent_id.blank? && problem.blank?

    @items
  end

end
