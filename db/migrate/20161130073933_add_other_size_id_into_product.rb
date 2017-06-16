class AddOtherSizeIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :other_size_id, :integer
  end

  def down
    remove_column :products, :other_size_id, :integer
  end
end
