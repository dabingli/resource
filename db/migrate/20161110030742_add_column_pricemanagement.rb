class AddColumnPricemanagement < ActiveRecord::Migration
  def change
    add_column :price_managements, :price_unit_id, :integer
    add_column :price_managements, :currency_id, :integer
  end
end
