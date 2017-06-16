class RenameColumnSeatPowersAndAdditionalFunctionsAndSafetyDevicesIntoProduct < ActiveRecord::Migration
  def up
    rename_column :products, :seat_powers_id, :seat_power_id
    rename_column :products, :additional_functions_id, :additional_function_id
    rename_column :products, :safety_devices_id, :safety_device_id
  end

  def down
    rename_column :products, :seat_power_id, :seat_powers_id
    rename_column :products, :additional_function_id, :additional_functions_id
    rename_column :products, :safety_device_id, :safety_devices_id
  end
end
