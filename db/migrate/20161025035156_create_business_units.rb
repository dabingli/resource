class CreateBusinessUnits < ActiveRecord::Migration
  def change
    create_table :business_units do |t|
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
