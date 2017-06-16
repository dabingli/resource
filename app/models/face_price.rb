class FacePrice < ActiveRecord::Base
	belongs_to :sku

  validates :sku_id, uniqueness: {
    message: '已存在该平台下的面价记录',
  }
end
