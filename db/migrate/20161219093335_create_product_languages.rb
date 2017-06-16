class CreateProductLanguages < ActiveRecord::Migration
  def change
    create_table :product_languages do |t|
      t.integer :product_id
      t.string :product_no
      t.string :name
      t.string :description
      t.string :brand
      t.integer :language_id

      t.timestamps null: false
    end
  end
end
