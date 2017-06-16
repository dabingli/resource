class CreateGlassVarieties < ActiveRecord::Migration
  def change
    create_table :glass_varieties do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
