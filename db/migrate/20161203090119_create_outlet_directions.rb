class CreateOutletDirections < ActiveRecord::Migration
  def change
    create_table :outlet_directions do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
