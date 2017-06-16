class AddPitsDistanceIntoProducts < ActiveRecord::Migration
  def up
    add_column :products, :pits_distance_id, :integer
  end

  def down
    remove_column :products, :pits_distance_id
  end
end
