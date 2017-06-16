class RemoveColumnProductimages < ActiveRecord::Migration
  def change
    remove_column :product_images, :series
    remove_column :product_images, :size
  end
end
