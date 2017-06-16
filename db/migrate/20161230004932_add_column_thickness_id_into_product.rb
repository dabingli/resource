class AddColumnThicknessIdIntoProduct < ActiveRecord::Migration
  def up
  	add_column :products, :thickness_id, :integer
  end
  def down
  	remove_column :thickness_id
  end
end
