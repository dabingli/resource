class CreateLampTechnologies < ActiveRecord::Migration
  def change
    create_table :lamp_technologies do |t|
      t.integer :position
      t.string :name
      t.string :en_name

      t.timestamps null: false
    end
  end
end
