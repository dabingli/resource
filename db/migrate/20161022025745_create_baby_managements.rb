class CreateBabyManagements < ActiveRecord::Migration
  def change
    create_table :baby_managements do |t|
      t.string :sku
      t.string :tag
      t.integer :position

      t.timestamps null: false
    end
  end
end
