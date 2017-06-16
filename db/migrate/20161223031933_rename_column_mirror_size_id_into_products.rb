class RenameColumnMirrorSizeIdIntoProducts < ActiveRecord::Migration
  def up
    rename_column :products, :mirror_size_id, :mirror_cabinet_range_id
  end

  def down
    rename_column :products, :mirror_cabinet_range_id, :mirror_size_id
  end
end
