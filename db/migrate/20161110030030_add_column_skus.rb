class AddColumnSkus < ActiveRecord::Migration
  def change
    add_column :skus, :price_unit_id, :integer
    add_column :skus, :currency_id, :integer
  end
end
