class FillRootProductCategoryIdForProducts < ActiveRecord::Migration
  def up
    sql = "update products set root_product_category_id = 1 where root_product_category_id is null"
    Product.connection.execute(sql)
  end
  
  def down
    # do nothing
  end
end
