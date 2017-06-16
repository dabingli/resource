class AddLidIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :lid_id, :integer
  end

  def down
    remove_column :products, :lid_id
  end
end
