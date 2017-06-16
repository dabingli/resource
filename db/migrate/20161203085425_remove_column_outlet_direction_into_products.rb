class RemoveColumnOutletDirectionIntoProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :outlet_direction
  end
end
