class CreateInstallationMethodsTable < ActiveRecord::Migration
  def change
    create_table :installation_methods do |t|
      t.integer :position
      t.string  :name

      t.timestamps null: false
    end
  end
end
