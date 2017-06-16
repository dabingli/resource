class RenameColumnCabinetSizeIdIntoProducts < ActiveRecord::Migration
  def up
    rename_column :products, :cabinet_size_id, :main_cabinet_range_id
  end

  def down
    rename_column :products, :main_cabinet_range_id, :cabinet_size_id
  end
end
