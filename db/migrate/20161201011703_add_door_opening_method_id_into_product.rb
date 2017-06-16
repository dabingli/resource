class AddDoorOpeningMethodIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :door_opening_method_id, :integer
  end

  def down
    remove_column :products, :door_opening_method_id, :integer
  end
end
