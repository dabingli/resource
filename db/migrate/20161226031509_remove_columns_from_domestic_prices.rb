class RemoveColumnsFromDomesticPrices < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        # 删除无效数据
        DomesticPrice.where('site_id IS NULL OR warehouse_id IS NULL').delete_all

        DomesticPrice.all.each do |record|
          sku = Sku.select(:id).find_by(product_id: record.product_id, level: record.level)
          if sku
            record.update! sku_id: sku.id
          else
            record.delete
          end
        end
      end
    end

    remove_column :domestic_prices, :level, :string
    remove_column :domestic_prices, :product_id, :integer
  end
end
