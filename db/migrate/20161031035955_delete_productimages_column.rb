class DeleteProductimagesColumn < ActiveRecord::Migration
  def change
    remove_column :product_images, :sku
  end
end
