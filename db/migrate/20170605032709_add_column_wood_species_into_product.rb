class AddColumnWoodSpeciesIntoProduct < ActiveRecord::Migration
  def change
  	add_column :products, :wood_species,          :string
  	add_column :products, :surface_effect,        :string
  	add_column :products, :mat_handle,            :string
  	add_column :products, :eco_level_id,          :integer
  	add_column :products, :buckle_type_id,        :integer
  	add_column :products, :chamfering_process_id, :integer
  	add_column :products, :wax_process_id,        :integer
  end
end
