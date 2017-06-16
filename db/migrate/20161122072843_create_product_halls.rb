class CreateProductHalls < ActiveRecord::Migration
  def change
    create_table :product_halls do |t|
      t.string :name
      t.integer :position
      t.integer :site_id
      
      t.timestamps null: false
    end
  end
end
