class AddColumnGlassThicknessIntoProducts < ActiveRecord::Migration
  def up
  	add_column :products, :glass_thickness_id, :integer
  end
  def down
  	remove_column :glass_thickness_id
  end
end
