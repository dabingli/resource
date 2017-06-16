class RenamePriceTables < ActiveRecord::Migration
  def change
    rename_table :price_managements, :domestic_prices
    create_table :export_prices do |t|
      t.integer  "sku_id"
      t.decimal  "price"
      t.integer  "price_unit_id"
      t.decimal  "nomember_price"
      t.decimal  "member_price"

      t.timestamps
    end
  end
end
