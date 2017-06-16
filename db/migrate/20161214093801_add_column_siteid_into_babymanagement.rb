class AddColumnSiteidIntoBabymanagement < ActiveRecord::Migration
  def up
    add_column :baby_managements, :site_id, :integer
  end

  def down
    remove_column :baby_managements, :site_id
  end
end
