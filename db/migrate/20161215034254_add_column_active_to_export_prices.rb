class AddColumnActiveToExportPrices < ActiveRecord::Migration
  def change
  	add_column :export_prices, :active, :boolean
  end
end
