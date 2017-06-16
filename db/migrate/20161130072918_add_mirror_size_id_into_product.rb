class AddMirrorSizeIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :mirror_size_id, :integer
  end

  def down
    remove_column :products, :mirror_size_id, :integer
  end
end
