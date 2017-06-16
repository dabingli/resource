class AddColumnSiteidIntoPricemanagement < ActiveRecord::Migration
  def up
    add_column :price_managements, :site_id, :integer
  end

  def down
    remove_column :price_managements, :site_id
  end
end
