class ProductCategoryMaterial < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :material
  default_scope {order(:position)}
end
