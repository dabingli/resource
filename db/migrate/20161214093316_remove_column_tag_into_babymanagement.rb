class RemoveColumnTagIntoBabymanagement < ActiveRecord::Migration
  def change
    remove_column :baby_managements, :tag
  end
end
