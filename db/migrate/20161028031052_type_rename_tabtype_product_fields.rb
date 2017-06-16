class TypeRenameTabtypeProductFields < ActiveRecord::Migration
  def change
    rename_column :product_fields, :type, :tabtype
  end
end
