class CreateProductCategoryMaterials < ActiveRecord::Migration
  def change
    create_table :product_category_materials do |t|
      t.integer :material_id
      t.integer :product_category_id

      t.timestamps null: false
    end
  end
end
