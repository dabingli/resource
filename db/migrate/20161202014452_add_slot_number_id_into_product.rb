class AddSlotNumberIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :slot_number_id, :integer
  end

  def down
    remove_column :products, :slot_number_id
  end
end
