class ProductCategoryProductType < ActiveRecord::Base
	belongs_to :product_category
	belongs_to :product_type
	default_scope {order(:position)}
end
