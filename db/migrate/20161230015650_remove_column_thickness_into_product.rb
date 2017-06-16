class RemoveColumnThicknessIntoProduct < ActiveRecord::Migration
  def change
    remove_column :products, :thickness, :decimal
  end
end
