class AddColumnFacePriceIdSkus < ActiveRecord::Migration
  def up
    add_column :skus, :face_price_id ,:integer
  end

  def down
    remove_column :skus, :face_price_id
  end
end
