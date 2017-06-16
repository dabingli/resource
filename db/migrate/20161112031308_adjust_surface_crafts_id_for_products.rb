class AdjustSurfaceCraftsIdForProducts < ActiveRecord::Migration
  def up
    sql = "update products set surface_craft_id = null where surface_craft_id = 1"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 1 where surface_craft_id = 2"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 2 where surface_craft_id = 3"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 3 where surface_craft_id = 4"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 4 where surface_craft_id = 5"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 5 where surface_craft_id = 6"
    Product.connection.execute(sql)
  end

  def down
    sql = "update products set surface_craft_id = 6 where surface_craft_id = 5"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 5 where surface_craft_id = 4"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 4 where surface_craft_id = 3"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 3 where surface_craft_id = 2"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 2 where surface_craft_id = 1"
    Product.connection.execute(sql)

    sql = "update products set surface_craft_id = 1 where surface_craft_id is null"
    Product.connection.execute(sql)
  end
end
