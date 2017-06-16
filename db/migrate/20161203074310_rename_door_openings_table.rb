class RenameDoorOpeningsTable < ActiveRecord::Migration
  def change
    rename_table :door_openings, :door_opening_methods
  end
end
