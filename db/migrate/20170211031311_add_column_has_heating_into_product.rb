class AddColumnHasHeatingIntoProduct < ActiveRecord::Migration
  def change
    add_column :products, :has_heating, :boolean
  end
end
