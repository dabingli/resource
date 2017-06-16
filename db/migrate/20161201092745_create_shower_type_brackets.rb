class CreateShowerTypeBrackets < ActiveRecord::Migration
  def change
    create_table :shower_type_brackets do |t|
      t.integer :position
      t.string :name

      t.timestamps null: false
    end
  end
end
