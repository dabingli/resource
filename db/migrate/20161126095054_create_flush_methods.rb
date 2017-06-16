class CreateFlushMethods < ActiveRecord::Migration
  def change
    create_table :flush_methods do |t|
      t.integer  "position"
      t.string   "name"
      t.timestamps null: false
    end
  end
end
