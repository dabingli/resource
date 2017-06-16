class AddSpoolStyleIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :spool_style_id, :integer
  end

  def down
    remove_column :products, :spool_style_id
  end
end
