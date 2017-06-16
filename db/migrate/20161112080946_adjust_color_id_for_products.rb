class AdjustColorIdForProducts < ActiveRecord::Migration
  def up
    sql = "update products set color_id = null where color_id = 1"
    Product.connection.execute(sql)

    sql = "update products set color_id = 1 where color_id = 2"
    Product.connection.execute(sql)

    sql = "update products set color_id = 2 where color_id = 3"
    Product.connection.execute(sql)

    sql = "update products set color_id = 3 where color_id = 4"
    Product.connection.execute(sql)

    sql = "update products set color_id = 4 where color_id = 5"
    Product.connection.execute(sql)

    sql = "update products set color_id = 5 where color_id = 6"
    Product.connection.execute(sql)

    sql = "update products set color_id = 6 where color_id = 7"
    Product.connection.execute(sql)

    sql = "update products set color_id = 7 where color_id = 8"
    Product.connection.execute(sql)

    sql = "update products set color_id = 8 where color_id = 9"
    Product.connection.execute(sql)

    sql = "update products set color_id = 9 where color_id = 10"
    Product.connection.execute(sql)
  end

  def down
    sql = "update products set color_id = 10 where color_id = 9"
    Product.connection.execute(sql)

    sql = "update products set color_id = 9 where color_id = 8"
    Product.connection.execute(sql)

    sql = "update products set color_id = 8 where color_id = 7"
    Product.connection.execute(sql)

    sql = "update products set color_id = 7 where color_id = 6"
    Product.connection.execute(sql)

    sql = "update products set color_id = 6 where color_id = 5"
    Product.connection.execute(sql)

    sql = "update products set color_id = 5 where color_id = 4"
    Product.connection.execute(sql)

    sql = "update products set color_id = 4 where color_id = 3"
    Product.connection.execute(sql)

    sql = "update products set color_id = 3 where color_id = 2"
    Product.connection.execute(sql)

    sql = "update products set color_id = 2 where color_id = 1"
    Product.connection.execute(sql)

    sql = "update products set color_id = 1 where color_id is null"
    Product.connection.execute(sql)
  end
end
