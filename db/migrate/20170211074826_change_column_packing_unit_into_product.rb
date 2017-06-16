class ChangeColumnPackingUnitIntoProduct < ActiveRecord::Migration
  def up
    change_column :products, :packing_unit, :string
  end

  def down
    change_column :products, :packing_unit, :integer
  end
end
