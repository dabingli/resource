class AddColumnTakeTemperatureIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :take_temperature_id, :integer
  end
  def down
  	remove_column :take_temperature_id
  end
end
