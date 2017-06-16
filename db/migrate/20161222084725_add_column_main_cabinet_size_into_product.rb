class AddColumnMainCabinetSizeIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :main_cabinet_size, :string
  end

  def down
    remove_column :products, :main_cabinet_size
  end
end
