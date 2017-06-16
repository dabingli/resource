class CreateLids < ActiveRecord::Migration
  def change
    create_table :lids do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
