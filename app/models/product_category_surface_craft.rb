class ProductCategorySurfaceCraft < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :surface_craft
  default_scope {order(:position)}
end
