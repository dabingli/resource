class CreateProductFields < ActiveRecord::Migration
  def change
    create_table :product_fields do |t|
      t.string :type
      t.string :field
      t.string :title
      t.string :style
      t.integer :position
      t.timestamps null: false
    end
  end
end
