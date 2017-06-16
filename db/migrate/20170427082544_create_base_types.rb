class CreateBaseTypes < ActiveRecord::Migration
  def change
    create_table :base_types do |t|
      t.integer :position
      t.string :name
      t.string :en_name

      t.timestamps null: false
    end
  end
end
