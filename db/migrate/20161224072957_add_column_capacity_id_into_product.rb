class AddColumnCapacityIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :capacity_id, :integer
  end
  def down
  	remove_column :capacity_id
  end
end
