# Helper methods for parsing parameters
module Api::V1::Concerns::ParamsHelper
  def platform_setting(key)
    Settings[:platform_settings]&.[](@site.code.to_sym)&.[](key)
  end

  # 分页参数
  def parse_pager_params
    page = params[:page].to_i
    page_size = params[:page_size].to_i
    page = 1 if page < 1
    page_size = 20 if page_size < 1

    @pager_offset = (page - 1) * page_size
    @pager_limit = page_size
  end

  # 解析 site_code 参数，以区分各平台
  # 设置 @site （Site 表记录）
  def set_site
    site_code = params[:site_code].presence
    return r_json(:parameter_missing, "Parameter required: site_code") if site_code.nil?

    @site = Site.where(code: site_code).first
    if @site.nil?
      r_json :wrong_parameter, "Unknown site: #{site_code}"
    end
  end

  # 解析 language 参数，确定返回语言
  def parse_language
    locale = params[:language].presence&.sub('_', '-')&.to_sym ||
             I18n.default_locale
    if locale.nil?
      r_json :parameter_missing, "Parameter required: language"
    elsif !I18n.available_locales.include?(locale)
      r_json :wrong_parameter, "Unsupported language: #{locale}"
    else
      @language = Language.find_by!(foreign: locale)
      # 避免 locale 影响其它请求
      I18n.with_locale(locale) do
        yield
      end
    end
  end

  def parse_warehouse
    warehouse = params[:warehouse].presence
    if warehouse
      @warehouse_id = find_id_by_name(Warehouse, warehouse)
      if @warehouse_id.nil?
        r_json :wrong_parameter, "Unknown warehouse: #{warehouse}"
      end
    end
  end

  # 解析 is_validate 参数，以便对不同用户返回不同结果
  # 设置 @is_validate
  def parse_is_validate
    is_validate = params[:is_validate].presence
    if is_validate.nil?
      @user_type = :visitor
      return
    end

    @site_code = params[:site_code].presence

    unless @site_code.blank?
      case @site_code
      when 'chinahomeb2b', 'b2b'
        @user_type = is_validate.to_i == 1 ? :member : :not_member
      else
        @user_type = :member
      end
    else
      r_json :wrong_parameter, "Invalid is_validate"
    end
  end

  # 解析获取产品列表的筛选条件
  def parse_products_filters
    @filter = {}

    search = params[:search]&.strip.presence
    @filter[:search] = search if search

    # 未指定分类时不处理其它筛选条件
    return unless params[:product_category_id].presence

    category = ProductCategory.find_by id: params[:product_category_id]
    if category.nil?
      return r_json :wrong_parameter, "Unknown product category: #{params[:product_category_id]}"
    end

    available_filters = category.available_filters
    filter_params = params.permit(available_filters.keys).to_h.transform_values! do |value|
      value.is_a?(String) ? value.strip.presence : value.presence
    end

    @filter[:products] = filter_params.reject { |_, value| value.blank? }.symbolize_keys!
    @filter[:products][:product_category_id] = category.id_and_offspring_category_ids

    # 价格范围
    price = params[:price]&.strip.presence
    if price
      match = /\A([\d.]*)-([\d.]*)\z/.match price
      if !match
        return r_json :wrong_parameter, "Wrong parameter: price=#{price}"
      else
        @filter[:min_price] = match[1].to_f unless match[1].empty?
        @filter[:max_price] = match[2].to_f unless match[2].empty?
      end
    end

    @current_filters = @filter[:products].map do |field_name, value|
      field_name = field_name.to_s
      next if field_name == 'product_category_id'

      if field_name.end_with?('_id')
        value = field_name.sub(/_id$/, '').
                           classify.
                           constantize.
                           find_by(id: value)&.
                           send("#{locale_field_prefix}name")
      end
      {
        name: field_name,
        title: available_filters[field_name]["#{locale_field_prefix}title"],
        value_name: value,
      }
    end

    @current_filters.compact!

    if @filter[:min_price] || @filter[:max_price]
      @current_filters.push({
        name: 'price',
        title: I18n.chinese? ? '价格' : 'Price',
        value_name: price,
      })
    end
  end

  def find_id_by_name(model, name)
    model = model.classify.constantize if model.is_a?(String)
    name_columns = I18n.available_locales.map {|locale| "#{locale_field_prefix(locale)}name"}
    name_columns = name_columns.select {|column| model.column_names.include?(column)}

    where = name_columns.map {|column| "#{column} = ?" }.join(" OR ")
    model.select(:id).where(where, *[name] * name_columns.size).first&.id
  end
end
