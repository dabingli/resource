class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_category_id
      t.string :product_no
      t.string :name
      t.text :description
      t.string :spec
      t.string :brand
      t.string :material
      t.string :surface_craft
      t.integer :water_absrp_rate_id
      t.decimal :thickness
      t.integer :shape_id
      t.integer :color_id
      t.integer :cases_per_pallet
      t.string :base_unit
      t.decimal :unit_weight
      t.decimal :unit_area
      t.string :business_unit
      t.string :packing_unit
      t.decimal :package_weight

      t.timestamps null: false
    end
  end
end
