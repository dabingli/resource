class ExportPrice < ActiveRecord::Base
	belongs_to :sku
  belongs_to :price_unit

  validates :sku_id, uniqueness: {
    scope: :price_unit_id,
    message: '已存在该价格单位的价格记录',
  }
end
