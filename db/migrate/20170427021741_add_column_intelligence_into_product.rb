class AddColumnIntelligenceIntoProduct < ActiveRecord::Migration
  def change
  	add_column :products, :intelligence, :boolean
  	add_column :products, :applicable_space_id, :integer
  	add_column :products, :light_material_id, :integer
  	add_column :products, :light_attachment_id, :integer
  	add_column :products, :lampshade_material_id, :integer
  	add_column :products, :lampshade_attachment_id, :integer
  	add_column :products, :lamp_technology_id, :integer
  	add_column :products, :light_source, :boolean
  	add_column :products, :source_category_id, :integer
  	add_column :products, :spatial_range_id, :integer
  	add_column :products, :suitable_storey_id, :integer
  	add_column :products, :light_category_id, :integer
  	add_column :products, :color_temperature_id, :integer
  	add_column :products, :lumen_id, :integer
  end
end
