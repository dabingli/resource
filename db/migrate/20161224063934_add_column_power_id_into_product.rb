class AddColumnPowerIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :power_id, :integer
  end
  def down
  	remove_column :power_id
  end
end
