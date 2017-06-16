class ProductCategoryBaseUnit < ActiveRecord::Base
  belongs_to :base_unit
  belongs_to :product_category
end
