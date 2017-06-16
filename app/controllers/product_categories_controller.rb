class ProductCategoriesController < ApplicationController
  # GET /product_categories/tree?parent_id=1
  # 获取产品分类树型结构，用于产品表单的分类选择
  # [
  #   {
  #     id: 1,
  #     name: '',
  #     children: [
  #       {
  #         id: 1,
  #         name: '',
  #         children: []
  #       }
  #     ]
  #   }
  # ]
  def tree
    all_categories = ProductCategory.all.map do |category|
      category.attributes.symbolize_keys
    end

    parent_id = params[:parent_id].to_i
    parent_id = nil if parent_id <= 0
    categories = get_children(all_categories, parent_id)

    render json: {
      code: 0,
      data: categories,
    }
  end

  private

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
        name: child[:name],
      }
      child[:children] = grandchildren unless grandchildren.nil?
      child
    end
    children
  end
end
