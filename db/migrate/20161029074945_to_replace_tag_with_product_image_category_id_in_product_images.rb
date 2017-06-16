class ToReplaceTagWithProductImageCategoryIdInProductImages < ActiveRecord::Migration
  def up
    remove_column :product_images, :tag
    add_column    :product_images, :product_image_category_id, :integer 
  end

  def down
    add_column    :product_images, :tag, :string
    remove_column :product_images, :product_image_category_id
  end
end
