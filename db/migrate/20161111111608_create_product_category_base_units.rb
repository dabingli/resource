class CreateProductCategoryBaseUnits < ActiveRecord::Migration
  def change
    create_table :product_category_base_units do |t|
      t.integer :product_category_id
      t.integer :position
      t.integer :base_unit_id

      t.timestamps null: false
    end
  end
end
