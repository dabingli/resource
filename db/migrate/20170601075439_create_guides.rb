class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.integer :product_category_id
      t.text :solution

      t.timestamps null: false
    end
  end
end
