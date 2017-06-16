class AddAppearanceIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :appearance_id, :integer
  end

  def down
    remove_column :products, :appearance_id
  end
end
