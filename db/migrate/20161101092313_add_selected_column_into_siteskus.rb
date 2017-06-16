class AddSelectedColumnIntoSiteskus < ActiveRecord::Migration
  def up
    add_column :site_skus, :selected, :boolean
  end

  def down
    remove_column :site_skus, :selected
  end
end
