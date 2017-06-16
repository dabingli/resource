class ProductCategoryProductStyle < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :product_style
  default_scope {order(:position)}
end
