class CreateSurfaceCrafts < ActiveRecord::Migration
  def change
    create_table :surface_crafts do |t|
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
