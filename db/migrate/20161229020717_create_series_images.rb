class CreateSeriesImages < ActiveRecord::Migration
  def change
    create_table :series_images do |t|
      t.integer :product_category_id
      t.integer :image_id
      t.timestamps null: false

      t.index :product_category_id
    end

    reversible do |dir|
      dir.up do
        # 转移原先的系列图
        ProductImage.where('product_id IS NOT NULL').each do |record|
          if record.image_id
            SeriesImage.create!({
              product_category_id: record.product_id,
              image_id: record.image_id,
            })
          end
        end

        # 转移后删除
        ProductImage.where('product_id IS NOT NULL').delete_all
      end
    end
  end
end
