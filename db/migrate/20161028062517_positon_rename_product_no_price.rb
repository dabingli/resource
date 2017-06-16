class PositonRenameProductNoPrice < ActiveRecord::Migration
  def change
    rename_column :price_managements, :position, :product_no_id
  end
end
