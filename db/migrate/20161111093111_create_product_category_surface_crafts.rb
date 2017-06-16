class CreateProductCategorySurfaceCrafts < ActiveRecord::Migration
  def change
    create_table :product_category_surface_crafts do |t|
      t.integer :product_category_id
      t.integer :position
      t.integer :surface_craft_id

      t.timestamps null: false
    end
  end
end
