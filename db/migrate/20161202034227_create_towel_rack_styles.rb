class CreateTowelRackStyles < ActiveRecord::Migration
  def change
    create_table :towel_rack_styles do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
