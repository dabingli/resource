class AddColumnWaterTemperatureIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :water_temperature_id, :integer
  end
  def down
  	remove_column :water_temperature_id
  end
end
