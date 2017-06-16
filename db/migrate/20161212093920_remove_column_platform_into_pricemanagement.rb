class RemoveColumnPlatformIntoPricemanagement < ActiveRecord::Migration
  def change
    remove_column :price_managements, :platform
  end
end
