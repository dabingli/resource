class UdpateProductsPackingUnitDataType < ActiveRecord::Migration
  def up
   remove_column :products, :packing_unit
   add_column :products, :packing_unit, :integer
  end

  def down
   remove_column :products, :packing_unit
   add_column :products, :packing_unit, :string
  end
end
