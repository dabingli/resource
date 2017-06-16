class AddFlushControlMethodIdIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :flush_control_method_id, :integer
  end

  def down
    remove_column :products, :flush_control_method_id, :integer
  end
end
