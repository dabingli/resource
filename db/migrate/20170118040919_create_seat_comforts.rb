class CreateSeatComforts < ActiveRecord::Migration
  def change
    create_table :seat_comforts do |t|
      t.integer :position
      t.string :name
      t.string :en_name

      t.timestamps null: false
    end
  end
end
