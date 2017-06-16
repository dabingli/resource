class ProductType < ActiveRecord::Base
	has_many :product_category_product_types
end
