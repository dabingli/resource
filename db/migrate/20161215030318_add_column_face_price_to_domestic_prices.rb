class AddColumnFacePriceToDomesticPrices < ActiveRecord::Migration
  def change
  	add_column :domestic_prices, :face_price, :decimal
  	remove_column :domestic_prices, :price_unit_id
  	remove_column :domestic_prices, :currency_id
  end
end
