class DropTableProductManagement < ActiveRecord::Migration
  def change
  	drop_table :product_managements
  end
end
