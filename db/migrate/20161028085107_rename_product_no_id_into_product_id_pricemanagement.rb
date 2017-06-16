class RenameProductNoIdIntoProductIdPricemanagement < ActiveRecord::Migration
  def change
    rename_column :price_managements, :product_no_id, :product_id
  end
end
