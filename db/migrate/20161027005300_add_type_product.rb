class AddTypeProduct < ActiveRecord::Migration
  def up
    add_column :products, :type, :string
  end

  def down
    remove_column :products, :type
  end
end
