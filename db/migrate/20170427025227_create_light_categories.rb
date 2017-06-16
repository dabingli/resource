class CreateLightCategories < ActiveRecord::Migration
  def change
    create_table :light_categories do |t|
      t.integer :position
      t.string :name
      t.string :en_name

      t.timestamps null: false
    end
  end
end
