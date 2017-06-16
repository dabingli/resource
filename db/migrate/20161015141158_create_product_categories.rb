class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name
      t.integer :parent_id
      t.integer :position

      t.timestamps null: false
    end
  end
end
