class AddFacepriceSkuk < ActiveRecord::Migration
  def change
    add_column :skus, :face_price, :decimal
  end
end
