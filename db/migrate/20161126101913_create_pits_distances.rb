class CreatePitsDistances < ActiveRecord::Migration
  def change
    create_table :pits_distances do |t|
      t.integer  "position"
      t.string   "name"
      t.timestamps null: false
    end
  end
end
