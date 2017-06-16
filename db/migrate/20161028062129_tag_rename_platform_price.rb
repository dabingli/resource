class TagRenamePlatformPrice < ActiveRecord::Migration
  def change
    rename_column :price_managements, :tag, :platform
  end
end
