class TranslationsController < ApplicationController
  before_action :set_translations

  # GET /translations
  # 查看翻译
  def index
    set_product_categories
    @records.delete ProductCategory
  end

  # GET /translations/export
  # 到处翻译数据
  def export
    require 'csv'
    csv_string = CSV.generate do |csv|
      csv << ["名称", "ID", "中文值", "英文值"]
      @records.each do |model, records|
        records.each_with_index do |record, i|
          column1 = i == 0 ? model.model_name.human : nil
          csv << [column1, record.id, record.name, record.en_name]
        end

        csv << []
      end
    end

    send_data csv_string, type: 'application/vnd.ms-excel', filename: '资源中心翻译.csv'
  end

  private

  # 找到有翻译的表并加载数据
  def set_translations
    # 找出有 en_name 字段的模型
    models = ActiveRecord::Base.connection.tables.map do |table_name|
      (model = table_name.classify.constantize) rescue NameError
      model && model.column_names&.include?('en_name') ? model : nil
    end.reject(&:nil?)

    # 按中文排序
    models.sort_by! {|model| model.model_name.human.encode('gb18030')}

    @records = models.inject({}) do |h, model|
      h[model] = model.order(:position).load
      h
    end
  end

  # 设置产品分类翻译数据
  # 由于 HTML <table> 中每个叶子节点对应一行（tr），一个祖先节点可能对应多行（rowspan）
  # 因此要找出叶子节点，及每个叶子节点的深度、祖先节点
  def set_product_categories
    # 使用这种方式查询以避免无效数据影响显示
    ids = ProductCategory.top_categories.map(&:id_and_offspring_category_ids).flatten
    categories = ProductCategory.where(id: ids).map(&:attributes).map(&:symbolize_keys)

    # id => category，便于后续使用
    id_to_category = categories.inject({}) do |h, category|
      h[category[:id]] = category
      h
    end

    # 设置每个节点的祖先节点，及深度
    categories.each do |category|
      category[:ancestors] = []
      if category[:parent_id]
        parent = id_to_category[category[:parent_id]]
        while parent
          category[:ancestors] << parent
          parent = id_to_category[parent[:parent_id]]
        end
      end
      category[:level] = category[:ancestors].size + 1
    end

    # 叶子节点即是没有子节点的节点
    parent_ids = categories.map {|c| c[:parent_id]}
    leaf_categories = categories.reject do |c|
      parent_ids.include?(c[:id])
    end

    # 设置每个分类的叶子节点数量
    categories.each do |category|
      category[:leaf_count] = leaf_categories.select do |c|
        c[:ancestors].include?(category)
      end.size
    end

    # 节点的最大深度
    deepest_level = categories.map {|c| c[:level]}.max

    # 排序
    leaf_categories.sort_by! do |category|
      # 存在不同分类 position 相同的情况，暂时不能只使用 position 排序
      ([category] + category[:ancestors]).reverse.map { |c| [c[:position], c[:id]] }
    end

    @leaf_categories = leaf_categories
    @deepest_level = deepest_level
  end
end
