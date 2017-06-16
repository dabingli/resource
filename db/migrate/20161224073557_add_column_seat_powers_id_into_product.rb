class AddColumnSeatPowersIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :seat_powers_id, :integer
  end
  def down
  	remove_column :seat_powers_id
  end
end
