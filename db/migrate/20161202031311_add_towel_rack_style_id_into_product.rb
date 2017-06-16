class AddTowelRackStyleIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :towel_rack_style_id, :integer
  end

  def down
    remove_column :products, :towel_rack_style_id
  end
end
