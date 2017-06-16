class AddIndexForUpdateAt < ActiveRecord::Migration
  def change
    add_index :baby_managements, :updated_at
    add_index :base_units, :updated_at
    add_index :business_units, :updated_at
    add_index :colors, :updated_at
    add_index :currencies, :updated_at
    add_index :images, :updated_at
    add_index :materials, :updated_at
    add_index :price_managements, :updated_at
    add_index :price_units, :updated_at
    add_index :product_categories, :updated_at
    add_index :product_category_base_units, :updated_at
    add_index :product_category_colors, :updated_at
    add_index :product_category_materials, :updated_at
    add_index :product_category_shapes, :updated_at
    add_index :product_category_surface_crafts, :updated_at
    add_index :product_fields, :updated_at
    add_index :product_image_categories, :updated_at
    add_index :product_images, :updated_at
    add_index :product_managements, :updated_at
    add_index :products, :updated_at
    add_index :rim_categories, :updated_at
    add_index :shapes, :updated_at
    add_index :site_skus, :updated_at
    add_index :sites, :updated_at
    add_index :skus, :updated_at
    add_index :surface_crafts, :updated_at
    add_index :users, :updated_at
    add_index :warehouses, :updated_at
    add_index :water_absrp_rates, :updated_at
  end
end
