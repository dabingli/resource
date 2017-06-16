class AddDomesticToSites < ActiveRecord::Migration
  def change
    add_column :sites, :domestic, :boolean
    Site.update_all domestic: true
    Site.where(code: ['chinahomeb2b', 'lolatiles']).update_all domestic: false
  end
end
