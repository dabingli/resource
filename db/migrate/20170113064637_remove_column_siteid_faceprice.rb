class RemoveColumnSiteidFaceprice < ActiveRecord::Migration
  def up
    remove_column :face_prices, :site_id
  end

  def down
    add_column :face_prices, :site_id, :integer
  end
end
