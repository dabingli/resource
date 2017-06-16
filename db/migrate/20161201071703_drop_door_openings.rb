class DropDoorOpenings < ActiveRecord::Migration
  def change
    drop_table :door_openings
  end
end
