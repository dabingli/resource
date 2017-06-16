class AddColumnBabymanagement < ActiveRecord::Migration
  def up
    add_column :baby_managements, :baby_no, :integer
  end

  def down
    remove_column :baby_managements, :baby_no
  end
end
