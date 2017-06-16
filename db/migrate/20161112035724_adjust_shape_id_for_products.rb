class AdjustShapeIdForProducts < ActiveRecord::Migration
  def up
    sql = "update products set shape_id = null where shape_id = 1"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 1 where shape_id = 2"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 2 where shape_id = 3"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 3 where shape_id = 4"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 4 where shape_id = 5"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 5 where shape_id = 6"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 6 where shape_id = 7"
    Product.connection.execute(sql)
  end

  def down
    sql = "update products set shape_id = 7 where shape_id = 6"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 6 where shape_id = 5"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 5 where shape_id = 4"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 4 where shape_id = 3"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 3 where shape_id = 2"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 2 where shape_id = 1"
    Product.connection.execute(sql)

    sql = "update products set shape_id = 1 where shape_id is null"
    Product.connection.execute(sql)
  end
end
