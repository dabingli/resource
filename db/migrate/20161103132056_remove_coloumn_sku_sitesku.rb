class RemoveColoumnSkuSitesku < ActiveRecord::Migration
  def change
    remove_column :site_skus, :sku
  end
end
