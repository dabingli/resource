class RemoveColumnId10ForProducts < ActiveRecord::Migration
  def up
    sql = "delete from colors where id = 10"
    Product.connection.execute(sql)
  end

  def down
    #Don't do nothing
  end
end
