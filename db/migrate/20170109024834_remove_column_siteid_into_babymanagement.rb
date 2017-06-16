class RemoveColumnSiteidIntoBabymanagement < ActiveRecord::Migration
  def up
    remove_column :baby_managements, :site_id
  end

  def down
    add_column :baby_managements, :site_id, :integer
  end
end
