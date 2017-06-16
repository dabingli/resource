class AddTapHoldIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :tap_hole_id, :integer
  end

  def down
    remove_column :products, :tap_hole_id, :integer
  end
end
