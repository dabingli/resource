class AddHasMirrorLampIntoProduct < ActiveRecord::Migration
  def up
      add_column :products, :has_mirror_lamp, :boolean
  end

  def down
    remove_column :products, :has_mirror_lamp, :boolean
  end
end
