class TypeRenameTabtypeProducts < ActiveRecord::Migration
  def change
    rename_column :products, :type, :tabtype
  end
end
