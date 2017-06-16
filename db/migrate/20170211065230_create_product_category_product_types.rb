class CreateProductCategoryProductTypes < ActiveRecord::Migration
  def change
    create_table :product_category_product_types do |t|
    	t.integer :product_type_id
    	t.integer :product_category_id
    	t.integer :position

    	t.timestamps null: false
    end
  end
end
