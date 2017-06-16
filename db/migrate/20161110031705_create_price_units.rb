class CreatePriceUnits < ActiveRecord::Migration
  def change
    create_table :price_units do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
