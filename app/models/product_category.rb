# == Schema Information
#
# Table name: product_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductCategory < ApplicationRecord
  belongs_to :parent, class_name: 'ProductCategory'
  has_many :children,
           -> { order(:position) },
           class_name: 'ProductCategory',
           foreign_key: 'parent_id'
  has_many :product_category_materials
  has_many :materials, through: :product_category_materials
  has_many :product_category_surface_crafts
  has_many :surface_crafts, through: :product_category_surface_crafts
  has_many :product_category_shapes
  has_many :shapes, through: :product_category_shapes
  has_many :product_category_base_units
  has_many :base_units, through: :product_category_base_units
  has_many :product_category_spec_sizes
  has_many :spec_sizes, through: :product_category_spec_sizes

  scope :top_categories, -> { where(parent_id: nil).order(:position) }

  # 顶级分类 id，避免各处代码中写死
  TOP_ID = {
    tiles: 1,
    mosaic: 101,
    bathing: 201,
    auxiliary_material: 401,
    furniture: 501,
    home_furnishing: 588,
    material_exhibit: 701,
    floor: 801,
    stone: 901,
    lighting: 1301,
  }.freeze

  # 获取顶级分类 id，避免各处代码中写死
  # 若不存在，抛出异常，以便发现问题
  def self.top_id(category_name)
    key = category_name.to_sym
    return TOP_ID[key] if TOP_ID.key?(key)
    raise KeyError, "Unknown top product category: #{category_name.inspect}"
  end

  # 下拉列表的可选值，用于产品表单
  # 返回 [[name, id],]
  def select_options(column_name)
    name = column_name.to_s.sub(/_id$/, '')
    model = name.classify.constantize
    collection = nil

    # 例如 column_name 为 shape_id
    # 若存在关联表 product_category_shapes，则优先使用这个表中的数据
    begin
      association_model = "product_category_#{name}".classify.constantize
    rescue NameError
      association_model = nil
    end
    unless association_model.nil?
      id_and_ancestor_category_ids.each do |category_id|
        collection = association_model.
                        joins(model.model_name.singular.to_sym).
                        where(product_category_id: category_id).
                        order(:position).
                        pluck("#{model.table_name}.name", "#{model.table_name}.id")
        break unless collection.blank?
      end
    end

    # 若不存在关联表，或数据为空，则使用 shapes 表
    collection = model.order(:position).pluck(:name, :id) if collection.blank?

    collection
  end

  # 层级（深度）。从 1 开始
  def level
    return @level if @level

    @level = 1
    category = self
    while category.parent_id
      @level += 1
      category = category.parent
    end

    @level
  end

  # 根分类
  def root_category
    return @root_category if @root_category

    category = self
    category = category.parent while category.parent_id

    @root_category = category
  end

  # 后代分类 ID
  def offspring_category_ids
    return @offspring_category_ids if @offspring_category_ids
    return [] if children.blank?

    @offspring_category_ids = []
    children_ids = ProductCategory.where(parent_id: id).ids
    until children_ids.blank?
      @offspring_category_ids.concat children_ids
      children_ids = ProductCategory.where(parent_id: children_ids).ids
    end

    @offspring_category_ids
  end

  # 本分类 ID + 后代分类 ID
  def id_and_offspring_category_ids
    [id] + offspring_category_ids
  end

  # 祖先分类，不包含自身
  # 按分类层级从低到高排列
  def ancestor_categories
    return @ancestor_categories if @ancestor_categories

    @ancestor_categories = []
    category = parent
    while category
      @ancestor_categories << category
      category = category.parent
    end
    @ancestor_categories
  end

  def id_and_ancestor_category_ids
    [id] + ancestor_categories.map(&:id)
  end

  # 是否是当前分类的祖先分类
  def ancestor?(other_product_category_id)
    if other_product_category_id.is_a?(String)
      other_product_category_id = other_product_category_id.to_i
    end

    ancestor_categories.any? do |category|
      category.id == other_product_category_id
    end
  end

  # 该分类的产品拥有的字段
  def product_field_names
    @product_field_names ||= product_fields.map(&:name)
  end

  # 产品属性（product_fields 表记录）
  def product_fields
    return @product_fields if @product_fields

    # 若当前分类不存在属性表，使用其祖先分类的
    category = self
    while category
      @product_fields = ProductField.where(product_category_id: category.id).
                                     order(:position).
                                     to_a
      break unless @product_fields.blank?
      category = category.parent
    end

    @product_fields
  end

  # 需要国际化的产品属性
  def international_fields
    product_field_names = product_fields.map(&:name)
    (ProductLanguage.column_names - %w(id created_at updated_at)).select do |name|
      name !~ /_id$/ && product_field_names.include?(name)
    end
  end

  # 价格单位数量
  # 瓷砖、马赛克有两种价格单位（片、平方米），其它分类只有一种
  def price_units_count
    if id == ProductCategory.top_id(:tiles) || id == ProductCategory.top_id(:mosaic)
      2
    else
      1
    end
  end

  # 可用的筛选条件字段及名称信息
  # {
  #   field_name: {
  #     title: '',
  #     en_title: '',
  #   }
  # }
  def available_filters
    # 若当前分类未设置筛选条件，使用其祖先分类的
    category = self
    category = category.parent until FILTER_FIXTURES.key?(category.id)

    FILTER_FIXTURES[category.id]
  end

  def available_filter_values(query, filters)
    filter_values = filters.map do |field_name, options|
      # 无子分类时不返回
      if field_name == 'product_category_id'
        next if children.blank?
      else
        next unless product_field_names.include?(field_name)
      end

      {
        name: field_name,
        title: options["#{locale_field_prefix}title"],
        values: available_filter_values_of_field(query, field_name),
      }
    end

    filter_values.compact!
    filter_values
  end

  private

  def available_filter_values_of_field(query, field_name)
    case field_name
    when 'spec'
      range_pattern = /\A\d+\D\d+\z/
      values = query.distinct.
            pluck('products.spec').
            reject(&:blank?).
            sort do |a, b|
              # 基于自然语义排序
              if range_pattern =~ a && range_pattern =~ b
                a.split(/\D/).map(&:to_i) <=> b.split(/\D/).map(&:to_i)
              elsif range_pattern =~ a
                -1
              elsif range_pattern =~ b
                1
              else
                a <=> b
              end
            end
      values.map { |value| {id: value, name: value} }
    when 'product_category_id'
      children.select('id', "#{locale_field_prefix}name AS name").
               order(:position).
               map(&:attributes)
    when /_id$/
      field_name.sub(/_id$/, '').
                 classify.
                 constantize.
                 select('id', "#{locale_field_prefix}name AS name").
                 where(id: query.distinct.pluck("products.#{field_name}")).
                 order(:position).
                 map(&:attributes)
    else
      values = query.distinct.pluck("products.#{field_name}").sort
      values.map { |value| {id: value, name: value} }
    end
  end
end
