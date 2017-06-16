class RemovePitsDistanceForProducts < ActiveRecord::Migration
  def change
    remove_column :products, :pits_distance_id, :boolean
  end
end
