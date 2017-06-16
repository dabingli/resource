class RemoveColumnFacepriceIntoDomesticprice < ActiveRecord::Migration
  def change
    remove_column :domestic_prices, :face_price
  end
end
