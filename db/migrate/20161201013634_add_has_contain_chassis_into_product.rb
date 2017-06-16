class AddHasContainChassisIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :has_contain_chassis, :boolean
  end

  def down
    remove_column :products, :has_contain_chassis, :boolean
  end
end
