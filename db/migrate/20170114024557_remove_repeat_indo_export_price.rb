class RemoveRepeatIndoExportPrice < ActiveRecord::Migration
  def change
  	reversible do |dir|
      dir.up do
				result = ExportPrice.find_by_sql("SELECT sku_id, price_unit_id, COUNT(*) FROM export_prices GROUP BY sku_id, price_unit_id HAVING COUNT(*) > 1 ORDER BY sku_id")
				result.each do |record|
				  ids = ExportPrice.where(sku_id: record[:sku_id], price_unit_id: record[:price_unit_id]).ids
				  ExportPrice.where(id: ids[1..-1]).delete_all
				end
			end
    end
  end
end