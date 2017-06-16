class RenameRootProductCategoryIdInProductFields < ActiveRecord::Migration
  def change
    rename_column :product_fields, :root_product_category_id, :product_category_id
  end
end
