class AddColumnSideCabinetSizeIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :side_cabinet_size, :string
  end

  def down
    remove_column :products, :side_cabinet_size
  end
end
