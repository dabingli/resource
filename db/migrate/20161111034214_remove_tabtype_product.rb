class RemoveTabtypeProduct < ActiveRecord::Migration
  def change
    remove_column :products, :tabtype, :integer
  end
end
