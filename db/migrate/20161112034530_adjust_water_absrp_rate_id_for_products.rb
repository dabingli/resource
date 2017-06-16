class AdjustWaterAbsrpRateIdForProducts < ActiveRecord::Migration
  def up
    sql = "update products set water_absrp_rate_id = null where water_absrp_rate_id = 1"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 1 where water_absrp_rate_id = 2"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 2 where water_absrp_rate_id = 3"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 3 where water_absrp_rate_id = 4"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 4 where water_absrp_rate_id = 5"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 5 where water_absrp_rate_id = 6"
    Product.connection.execute(sql)
  end

  def down
    sql = "update products set water_absrp_rate_id = 6 where water_absrp_rate_id = 5"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 5 where water_absrp_rate_id = 4"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 4 where water_absrp_rate_id = 3"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 3 where water_absrp_rate_id = 2"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 2 where water_absrp_rate_id = 1"
    Product.connection.execute(sql)

    sql = "update products set water_absrp_rate_id = 1 where water_absrp_rate_id is null"
    Product.connection.execute(sql)
  end
end
