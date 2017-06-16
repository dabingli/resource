class RemoveUselessTableAndColumns < ActiveRecord::Migration
  def change
    drop_table :product_category_colors do |t|
      t.integer :product_category_id
      t.integer :color_id
      t.timestamps null: false

      t.index :updated_at
    end

    remove_column :product_images, :product_id, :integer
    remove_column :skus, :name, :string
  end
end
