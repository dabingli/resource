class AddWholeMaterialIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :whole_material_id, :integer
  end

  def down
    remove_column :products, :whole_material_id
  end
end
