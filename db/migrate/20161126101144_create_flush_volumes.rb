class CreateFlushVolumes < ActiveRecord::Migration
  def change
    create_table :flush_volumes do |t|
      t.integer  "position"
      t.string   "name"
      t.timestamps null: false
    end
  end
end
