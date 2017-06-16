class AdjustMaterialIdForProducts < ActiveRecord::Migration
  def up
    sql = "update products set material_id = null where material_id = 1"
    Product.connection.execute(sql)

    sql = "update products set material_id = 1 where material_id = 2"
    Product.connection.execute(sql)

    sql = "update products set material_id = 2 where material_id = 3"
    Product.connection.execute(sql)

    sql = "update products set material_id = 3 where material_id = 4"
    Product.connection.execute(sql)

    sql = "update products set material_id = 4 where material_id = 5"
    Product.connection.execute(sql)

    sql = "update products set material_id = 5 where material_id = 6"
    Product.connection.execute(sql)

    sql = "update products set material_id = 6 where material_id = 7"
    Product.connection.execute(sql)

    sql = "update products set material_id = 7 where material_id = 8"
    Product.connection.execute(sql)

    sql = "update products set material_id = 8 where material_id = 9"
    Product.connection.execute(sql)

    sql = "update products set material_id = 9 where material_id = 10"
    Product.connection.execute(sql)

    sql = "update products set material_id = 10 where material_id = 11"
    Product.connection.execute(sql)

    sql = "update products set material_id = 11 where material_id = 12"
    Product.connection.execute(sql)

  end

  def down
    sql = "update products set material_id = 12 where material_id = 11"
    Product.connection.execute(sql)

    sql = "update products set material_id = 11 where material_id = 10"
    Product.connection.execute(sql)

    sql = "update products set material_id = 10 where material_id = 9"
    Product.connection.execute(sql)

    sql = "update products set material_id = 9 where material_id = 8"
    Product.connection.execute(sql)

    sql = "update products set material_id = 8 where material_id = 7"
    Product.connection.execute(sql)

    sql = "update products set material_id = 7 where material_id = 6"
    Product.connection.execute(sql)

    sql = "update products set material_id = 6 where material_id = 5"
    Product.connection.execute(sql)

    sql = "update products set material_id = 5 where material_id = 4"
    Product.connection.execute(sql)

    sql = "update products set material_id = 4 where material_id = 3"
    Product.connection.execute(sql)

    sql = "update products set material_id = 3 where material_id = 2"
    Product.connection.execute(sql)

    sql = "update products set material_id = 2 where material_id = 1"
    Product.connection.execute(sql)

    sql = "update products set material_id = 1 where material_id is null"
    Product.connection.execute(sql)
  end
end
