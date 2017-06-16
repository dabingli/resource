class AddColumnPackageMethodIdIntoProducts < ActiveRecord::Migration
  def up
    add_column :products, :package_method_id, :integer
  end

  def down
    remove_column :products, :package_method_id
  end
end
