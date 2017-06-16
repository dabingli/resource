class CreateLampshadeMaterials < ActiveRecord::Migration
  def change
    create_table :lampshade_materials do |t|
      t.integer :position
      t.string :name
      t.string :en_name

      t.timestamps null: false
    end
  end
end
