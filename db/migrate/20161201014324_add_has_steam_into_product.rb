class AddHasSteamIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :has_steam, :boolean
  end

  def down 
    remove_column :products, :has_steam, :boolean
  end
end
