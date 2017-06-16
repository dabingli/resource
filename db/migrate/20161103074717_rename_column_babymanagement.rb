class RenameColumnBabymanagement < ActiveRecord::Migration
  def change
    rename_column :baby_managements, :position, :product_id
  end
end
