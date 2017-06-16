class AddHasColdHotWaterIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :has_cold_hot_water, :boolean 
  end

  def down
    remove_column :products, :has_cold_hot_water
  end
end
