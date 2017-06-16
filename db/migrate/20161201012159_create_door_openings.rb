class CreateDoorOpenings < ActiveRecord::Migration
  def change
    create_table :door_openings do |t|
      t.integer :position
      t.string  :name
      t.timestamps null: false
    end
  end
end
