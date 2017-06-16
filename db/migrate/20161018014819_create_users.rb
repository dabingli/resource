class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :employee_number
      t.string :name
      t.string :mobile
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
