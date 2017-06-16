class SkuRenameLevelPrice < ActiveRecord::Migration
  def change
    rename_column :price_managements, :sku, :level
  end
end
