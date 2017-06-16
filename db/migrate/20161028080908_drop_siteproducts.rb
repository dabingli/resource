class DropSiteproducts < ActiveRecord::Migration
  def change
    drop_table :site_products
  end
end
