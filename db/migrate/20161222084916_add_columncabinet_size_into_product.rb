class AddColumncabinetSizeIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :cabinet_size, :string
  end

  def down
    remove_column :products, :cabinet_size
  end
end
