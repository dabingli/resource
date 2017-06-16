class AddWarehouseId < ActiveRecord::Migration
  def change
    add_column :price_managements, :warehouse_id, :integer
  end
end
