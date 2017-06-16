class AddPriceColumnPricemanagements < ActiveRecord::Migration
  def up
    add_column :price_managements, :face_price, :decimal
    add_column :price_managements, :nomember_price, :decimal
    add_column :price_managements, :member_price, :decimal
  end

  def down
    remove_column :price_managements, :face_price
    remove_column :price_managements, :nomember_price
    remove_column :price_managements, :member_price
  end
end
