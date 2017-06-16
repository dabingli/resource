class AddColumnProduct < ActiveRecord::Migration
  def change
    add_column :products, :rim_category_id, :integer
  end
end
