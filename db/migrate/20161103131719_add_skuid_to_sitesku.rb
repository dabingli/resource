class AddSkuidToSitesku < ActiveRecord::Migration
  def up
    add_column :site_skus, :sku_id, :integer
  end

  def down
    remove_column :site_skus, :sku_id
  end
end
