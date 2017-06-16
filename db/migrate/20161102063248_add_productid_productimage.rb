class AddProductidProductimage < ActiveRecord::Migration
  def up
    add_column :product_images, :product_id, :integer
  end

  def down
    remove_column :product_images
  end
end
