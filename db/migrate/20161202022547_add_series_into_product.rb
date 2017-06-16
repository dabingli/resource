class AddSeriesIntoProduct < ActiveRecord::Migration
  def up
    add_column :products, :series, :string
  end

  def down
    remove_column :products, :series
  end
end
