class RemoveSelectedFromSiteSkus < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        SiteSku.where(selected: false).delete_all
      end
    end

    remove_column :site_skus, :selected, :boolean
    remove_column :site_skus, :product_id, :integer
  end
end
