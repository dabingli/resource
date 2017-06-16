class AddColumnFeatureIdAndBaseTypeIdAndLightQuantityIdIntoProduct < ActiveRecord::Migration
  def change
  	add_column :products, :feature_id, :integer
  	add_column :products, :base_type_id, :integer
  	add_column :products, :light_quantity_id, :integer
  end
end
