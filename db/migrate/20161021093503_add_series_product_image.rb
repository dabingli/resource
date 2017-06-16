class AddSeriesProductImage < ActiveRecord::Migration
  def up
    add_column :product_images,  :series, :text
    add_column :product_images,  :size, :string
  end

  def down
    remove_column :product_images, :series
    remove_column :product_images, :size
  end
end