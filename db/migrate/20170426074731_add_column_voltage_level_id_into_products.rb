class AddColumnVoltageLevelIdIntoProducts < ActiveRecord::Migration
  def change
  	add_column :products, :voltage_level_id, :integer
  end
end
