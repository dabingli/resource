class AddChassisMaterialIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :chassis_material_id, :integer
  end

  def down
    remove_column :products, :chassis_material_id, :integer
  end
end
