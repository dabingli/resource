class Api::V1::ProductCategoriesController < Api::V1::BaseController
  # get /product_categories
  # 获取产品分类，树型结构
  def index
    parent_id = params[:parent_id].present? ? params[:parent_id].to_i : nil

    # 为减少数据库查询次数，一次查出所有，本地处理
    categories = ProductCategory.all

    categories = categories.map { |record| record.attributes.symbolize_keys }
    result = get_children(categories, parent_id) || []
    r_json :ok, result
  end

  private

  def set_product_category
    # 不存在时会抛出异常
    @product_category = ProductCategory.find(params[:id])
  end

  # 获取某个分类的子分类，递归调用
  def get_children(categories, parent_id)
    children = categories.
      select { |category| category[:parent_id] == parent_id }.
      sort_by! { |category| category[:position] }

    return nil if children.empty?

    children = children.map do |child|
      grandchildren = get_children(categories, child[:id])
      # 若直接从 child 中删掉不需要的 key，categories 也会随之变化，容易产生不可预料的风险
      child = {
        id: child[:id],
        name: child[:"#{locale_field_prefix}name"],
      }
      child[:children] = grandchildren unless grandchildren.nil?
      child
    end
    children
  end
end
