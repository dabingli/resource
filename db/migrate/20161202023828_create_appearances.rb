class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
