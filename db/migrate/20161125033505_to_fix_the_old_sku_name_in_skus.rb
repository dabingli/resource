class ToFixTheOldSkuNameInSkus < ActiveRecord::Migration
  def up
    Sku.all.each do |sku|
      pn = sku.product.product_no
      if sku.name == pn
        sku.name = pn + '-' + sku.level
        sku.save!
      end
    end
  end

  def down
    # do nothing
  end
end
