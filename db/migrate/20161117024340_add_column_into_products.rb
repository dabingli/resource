class AddColumnIntoProducts < ActiveRecord::Migration
  def up
    add_column :products, :package_dimension, :string
  end

  def down
    remove_column :products, :package_dimension
  end
end
