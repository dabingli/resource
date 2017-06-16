module ApplicationHelper
  def products_or_products_suit_path(product_category_id)
    root_category_id = ProductCategory.find(product_category_id).root_category.id

    case root_category_id
    when ProductCategory.top_id(:tiles),
         ProductCategory.top_id(:mosaic),
         ProductCategory.top_id(:auxiliary_material),
         ProductCategory.top_id(:material_exhibit),
         ProductCategory.top_id(:floor),
         ProductCategory.top_id(:stone),
         ProductCategory.top_id(:lighting)
      products_path(product_category_id: product_category_id)
    else
      suit_products_path(product_category_id: product_category_id)
    end
  end
end
