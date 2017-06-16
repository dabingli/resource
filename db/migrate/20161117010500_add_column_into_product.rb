class AddColumnIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :product_use_place_id, :integer
    add_column :products, :product_style_id, :integer
  end

  def down
    remove_column :product, :product_user_place_id
    remove_column :product, :product_style_id
  end
end
