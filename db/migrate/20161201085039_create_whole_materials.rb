class CreateWholeMaterials < ActiveRecord::Migration
  def change
    create_table :whole_materials do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
