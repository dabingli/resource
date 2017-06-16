class AddColumnOutletDirectionIdIntoProducts < ActiveRecord::Migration
  def up
  	add_column :products, :outlet_direction_id, :integer
  end

  def down
  	remove_column :products, :outlet_direction_id
  end
end
