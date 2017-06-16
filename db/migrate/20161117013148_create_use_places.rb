class CreateUsePlaces < ActiveRecord::Migration
  def change
    create_table :use_places do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
