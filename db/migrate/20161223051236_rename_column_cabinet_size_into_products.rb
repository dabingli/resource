class RenameColumnCabinetSizeIntoProducts < ActiveRecord::Migration
  def up
    rename_column :products, :cabinet_size, :mirror_cabinet_size
  end

  def down
    rename_column :products, :mirror_cabinet_size, :cabinet_size
  end
end
