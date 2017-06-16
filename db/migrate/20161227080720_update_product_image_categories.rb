class UpdateProductImageCategories < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        # 图片分类 ID 有变，现有数据中的分类应改变
        # old_id => new_id
        new_ids = {
          1 => 1,
          2 => 2,
          3 => 2,
          4 => 2,
          5 => 2,
          6 => 2,
          7 => 2,
          8 => 2,
          9 => 2,
          10 => 2,
          11 => 2,
          12 => 2,
          13 => 2,
          14 => 2,
          15 => 3,
          16 => 6,
          26 => 6,
          27 => 6,
          17 => 7,
          18 => 8,
          28 => 8,
          29 => 8,
          30 => 8,
          19 => 9,
          20 => 10,
          21 => 11,
          22 => 4,
          31 => 4,
          23 => 12,
          24 => 15,
          25 => 5,
          32 => 13,
          33 => 14,
          34 => 16,
          35 => 17,
        }

        ProductImage.all.each do |record|
          new_id = new_ids[record.product_image_category_id]
          if new_id
            record.update({
              product_image_category_id: new_id,
              position: record.product_image_category_id,
            })
          else
            record.delete
          end
        end
      end
    end

    add_column :product_image_categories, :max_count, :integer
  end
end
