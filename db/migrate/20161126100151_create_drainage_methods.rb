class CreateDrainageMethods < ActiveRecord::Migration
  def change
    create_table :drainage_methods do |t|
      t.integer  "position"
      t.string   "name"
      t.timestamps null: false
    end
  end
end
