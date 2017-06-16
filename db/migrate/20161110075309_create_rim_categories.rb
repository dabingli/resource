class CreateRimCategories < ActiveRecord::Migration
  def change
    create_table :rim_categories do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
