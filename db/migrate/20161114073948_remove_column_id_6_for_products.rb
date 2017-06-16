class RemoveColumnId6ForProducts < ActiveRecord::Migration
  def up
    sql = "delete from water_absrp_rates where id = 6"
    Product.connection.execute(sql)
  end

  def down
    #Don't do nothing
  end
end
