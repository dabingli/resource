class RemoveColumnWholeMaterial < ActiveRecord::Migration
  def change
    remove_column :products, :whole_material
  end
end
