class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.integer :product_id
      t.string :level
      t.string :name

      t.timestamps null: false
    end
  end
end
