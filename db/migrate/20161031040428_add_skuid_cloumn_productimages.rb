class AddSkuidCloumnProductimages < ActiveRecord::Migration
  def change
    add_column :product_images, :sku_id, :integer
  end
end
