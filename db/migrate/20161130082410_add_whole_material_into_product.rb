class AddWholeMaterialIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :whole_material, :string
  end

  def down
    remove_column :products, :whole_material, :string
  end
end
