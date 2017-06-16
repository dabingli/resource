class AddGlassVarietiesIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :glass_varieties_id, :integer
  end

  def down
    remove_column :products, :glass_varieties_id, :integer
  end
end
