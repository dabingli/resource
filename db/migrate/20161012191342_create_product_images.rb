class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :sku
      t.string :tag
      t.integer :position
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
