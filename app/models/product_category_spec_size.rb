class ProductCategorySpecSize < ActiveRecord::Base
	belongs_to :product_category
	belongs_to :spec_size
	default_scope {order(:position)}
end
