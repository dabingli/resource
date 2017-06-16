class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :position
      t.string :name
      t.string :foreign

      t.timestamps null: false
    end
  end
end
