class CreateProductCategoryProductStyles < ActiveRecord::Migration
  def change
    create_table :product_category_product_styles do |t|
      t.integer :product_category_id
      t.integer :position
      t.integer :product_style_id

      t.timestamps null: false
    end
  end
end
