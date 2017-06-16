class AddHasWaterBrandIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :has_water_bend, :boolean
  end

  def down
    remove_column :products, :has_water_bend, :boolean
  end
end
