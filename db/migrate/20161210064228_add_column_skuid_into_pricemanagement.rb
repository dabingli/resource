class AddColumnSkuidIntoPricemanagement < ActiveRecord::Migration
  def up
    add_column :price_managements, :sku_id, :integer
  end

  def down
    remove_column :price_managements, :sku_id
  end
end
