class AddColumnProductCategorymaterial < ActiveRecord::Migration
  def change
    add_column :product_category_materials, :position, :integer
  end
end
