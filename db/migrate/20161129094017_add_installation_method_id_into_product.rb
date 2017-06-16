class AddInstallationMethodIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :installation_method_id, :integer
  end

  def down
    remove_column :products, :installation_method_id, :integer
  end
end
