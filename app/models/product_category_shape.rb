class ProductCategoryShape < ActiveRecord::Base
   belongs_to :product_category
   belongs_to :shape
   default_scope {order(:position)}
end
