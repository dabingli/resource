class SynchronousSkuDataAndBabymanagementData < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Sku.all.each do |record|
          sku = BabyManagement.select(:sku_id).find_by(sku_id: record[:id])
          unless sku
            BabyManagement.new(sku_id: record[:id]).save
          end
        end
      end
    end
  end
end
