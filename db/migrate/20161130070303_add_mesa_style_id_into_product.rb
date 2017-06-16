class AddMesaStyleIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :mesa_style_id, :integer
  end

  def down
    remove_column :products, :mesa_style_id, :integer
  end
end
