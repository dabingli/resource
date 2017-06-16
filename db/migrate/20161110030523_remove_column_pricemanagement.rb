class RemoveColumnPricemanagement < ActiveRecord::Migration
  def change
    remove_column :price_managements, :face_price, :decimal
  end
end
