class CreateProductCategoryColors < ActiveRecord::Migration
  def change
    create_table :product_category_colors do |t|
      t.integer :product_category_id
      t.integer :color_id

      t.timestamps null: false
    end
  end
end
