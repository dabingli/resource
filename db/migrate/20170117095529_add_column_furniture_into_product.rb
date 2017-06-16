class AddColumnFurnitureIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :product_origin,          :string
    add_column :products, :set_number,              :string
    add_column :products, :number_of_package_items, :string
    add_column :products, :product_structure_id,    :integer
    add_column :products, :facing_materials,        :string
    add_column :products, :product_fabric_id,       :integer
    add_column :products, :painting_process,        :string
    add_column :products, :surface_gloss_id,        :integer
    add_column :products, :spring_structure_id,     :integer
    add_column :products, :filler,                  :string
    add_column :products, :seat_comfort_id,         :integer
    add_column :products, :package_items,           :string
    add_column :products, :production_cycle,        :string
    add_column :products, :customizable,            :boolean
    add_column :products, :maintenance_instruction, :string
    add_column :products, :warranty_time,           :string
    add_column :products, :design_concept,          :string
    add_column :products, :meterial_advantage,      :string
    add_column :products, :functionality_advantage, :string
  end

  def down
    remove_column :products, :product_origin
    remove_column :products, :set_number
    remove_column :products, :number_of_package_items
    remove_column :products, :product_structure_id
    remove_column :products, :facing_materials
    remove_column :products, :product_fabric_id
    remove_column :products, :painting_process
    remove_column :products, :surface_gloss_id
    remove_column :products, :spring_structure_id
    remove_column :products, :filler
    remove_column :products, :seat_comfort_id
    remove_column :products, :package_items
    remove_column :products, :production_cycle
    remove_column :products, :customizable
    remove_column :products, :maintenance_instruction
    remove_column :products, :warranty_time
    remove_column :products, :design_concept
    remove_column :products, :meterial_advantage
    remove_column :products, :functionality_advantage
  end
end
