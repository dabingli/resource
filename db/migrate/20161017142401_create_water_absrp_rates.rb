class CreateWaterAbsrpRates < ActiveRecord::Migration
  def change
    create_table :water_absrp_rates do |t|
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
