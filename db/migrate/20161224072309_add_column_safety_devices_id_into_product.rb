class AddColumnSafetyDevicesIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :safety_devices_id, :integer
  end
  def down
  	remove_column :safety_devices_id
  end
end
