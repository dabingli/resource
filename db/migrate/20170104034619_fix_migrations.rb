class FixMigrations < ActiveRecord::Migration
  def up
    execute "DROP TABLE IF EXISTS cabinet_sizes"
    execute "DROP TABLE IF EXISTS mirror_sizes"
    execute "DROP TABLE IF EXISTS other_sizes"

    unless tables.include? 'face_prices'
      create_table :face_prices do |t|
        t.integer :sku_id
        t.integer :site_id
        t.decimal :price
        t.timestamps null: false
      end
    end

    # 解决服务器上字段顺序与 migration 生成的不一致的问题
    rename_table :export_prices, :export_prices_backup
    create_table :export_prices do |t|
      t.integer :sku_id
      t.integer :price_unit_id
      t.decimal :price
      t.decimal :nomember_price
      t.decimal :member_price
      t.boolean :active

      t.timestamps null: false
    end
    # 不能指定 ID，否则需手动更新 PostgreSQL 的 id sequence
    columns = 'sku_id, price_unit_id, price, nomember_price, member_price, active, created_at, updated_at'
    execute <<-SQL
      INSERT INTO export_prices(#{columns})
      SELECT #{columns} FROM export_prices_backup;
    SQL
    drop_table :export_prices_backup
  end

  def down
  end
end
