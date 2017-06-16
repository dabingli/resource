class CreateApplicableSpaces < ActiveRecord::Migration
  def change
    create_table :applicable_spaces do |t|
      t.integer :position
      t.string :name
      t.string :en_name

      t.timestamps null: false
    end
  end
end
