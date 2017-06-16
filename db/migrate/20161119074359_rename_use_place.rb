class RenameUsePlace < ActiveRecord::Migration
  def up
    rename_table :use_places, :product_use_places
  end

  def down
    rename_table :product_use_places, :use_places
  end
end
