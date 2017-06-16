class DropInstallationMethodsTable < ActiveRecord::Migration
  def change
    drop_table :installation_methods
  end
end
