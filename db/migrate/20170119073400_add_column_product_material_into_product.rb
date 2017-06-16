class AddColumnProductMaterialIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :product_material, :string
  end

  def down
    remove_column :products, :product_material
  end
end
