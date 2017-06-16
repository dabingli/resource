class CreateProductHallSkus < ActiveRecord::Migration
  def change
    create_table :product_hall_skus do |t|
      t.integer :product_hall_id
      t.integer :sku_id

      t.timestamps null: false
    end
  end
end
