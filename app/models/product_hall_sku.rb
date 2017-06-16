class ProductHallSku < ActiveRecord::Base
	belongs_to :product_hall
	belongs_to :sku
end
