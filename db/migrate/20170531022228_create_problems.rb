class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :product_category_id
      t.text :solution

      t.timestamps null: false
    end
  end
end
