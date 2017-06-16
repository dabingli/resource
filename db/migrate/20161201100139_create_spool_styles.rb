class CreateSpoolStyles < ActiveRecord::Migration
  def change
    create_table :spool_styles do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
