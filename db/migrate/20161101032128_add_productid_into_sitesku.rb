class AddProductidIntoSitesku < ActiveRecord::Migration
  def up
    add_column :site_skus,  :product_id, :integer
  end

  def down
    remove_column :site_skus, :product_id
  end
end
