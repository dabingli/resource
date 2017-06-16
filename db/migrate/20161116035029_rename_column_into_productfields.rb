class RenameColumnIntoProductfields < ActiveRecord::Migration
  def change
    rename_column :product_fields, :tabtype,  :root_product_category_id
    rename_column :product_fields, :datetype, :data_type
  end
end
