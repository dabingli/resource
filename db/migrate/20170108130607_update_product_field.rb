class UpdateProductField < ActiveRecord::Migration
  def change
    drop_table :product_fields do |t|
      t.string :root_product_category_id
      t.string :field
      t.string :title
      t.string :data_type
      t.integer :position
      t.timestamps null: false

      t.index :updated_at
    end

    create_table :product_fields do |t|
      t.integer :root_product_category_id
      t.integer :position
      t.string :name
      t.string :title
      t.boolean :required, default: false
      t.timestamps null: false

      t.index [:root_product_category_id, :position]
    end

    remove_column :product_languages, :product_no, :string
  end
end
