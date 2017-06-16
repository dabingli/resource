class AddDrainWaterWayIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :drain_water_way, :string
  end

  def down
    remove_column :products, :drain_water_way
  end
end
