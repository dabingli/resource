class CreateTapHoles < ActiveRecord::Migration
  def change
    create_table :tap_holes do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
