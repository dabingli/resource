class RemoveColumnSkus < ActiveRecord::Migration
  def change
    remove_column :skus, :face_price
    remove_column :skus, :price_unit_id
    remove_column :skus, :currency_id
  end
end
