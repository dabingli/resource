class AddColumnStorePriceIntoFacePrice < ActiveRecord::Migration
  def up
  	add_column :face_prices, :store_price, :decimal
  end
  def down
  	remove_column :store_price
  end
end
