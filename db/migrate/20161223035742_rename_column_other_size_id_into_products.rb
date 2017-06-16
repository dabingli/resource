class RenameColumnOtherSizeIdIntoProducts < ActiveRecord::Migration
  def up
    rename_column :products, :other_size_id, :side_cabinet_range_id
  end

  def down
    rename_column :products, :side_cabinet_range_id, :other_size_id
  end
end
