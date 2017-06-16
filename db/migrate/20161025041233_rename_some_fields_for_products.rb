class RenameSomeFieldsForProducts < ActiveRecord::Migration
  def up
    add_column :products, :surface_craft_id, :integer 
    add_column :products, :base_unit_id, :integer 
    add_column :products, :business_unit_id, :integer 
    add_column :products, :material_id, :integer 

    remove_column :products, :surface_craft
    remove_column :products, :base_unit
    remove_column :products, :business_unit
    remove_column :products, :material
  end

  def down 
    add_column :products, :surface_craft, :string
    add_column :products, :base_unit, :string
    add_column :products, :business_unit, :string
    add_column :products, :material, :string

    remove_column :products, :surface_craft_id
    remove_column :products, :base_unit_id
    remove_column :products, :business_unit_id
    remove_column :products, :material_id
  end
end
