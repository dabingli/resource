class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
