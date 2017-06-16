class AddColumnAdditionalFunctionsIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :additional_functions_id, :integer
  end
  def down
  	remove_column :additional_functions_id
  end
end
