class RemoveColumnFacepriceidSku < ActiveRecord::Migration
  def change
    remove_column :skus, :face_price_id
  end
end
