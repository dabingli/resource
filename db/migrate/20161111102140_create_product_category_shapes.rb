class CreateProductCategoryShapes < ActiveRecord::Migration
  def change
    create_table :product_category_shapes do |t|
      t.integer :product_category_id
      t.integer :position
      t.integer :shape_id

      t.timestamps null: false
    end
  end
end
