class AddRootproductcategoryidProduct < ActiveRecord::Migration
  def up
    add_column :products, :root_product_category_id, :integer
  end

  def down
    remove_column :products, :root_product_category_id
  end
end
