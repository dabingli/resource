# == Schema Information
#
# Table name: domestic_prices
#
#  id             :integer          not null, primary key
#  level          :string
#  platform       :string
#  product_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  face_price     :decimal(, )
#  nomember_price :decimal(, )
#  member_price   :decimal(, )
#  warehouse_id   :integer
#

class DomesticPrice < ApplicationRecord
  belongs_to :site
  belongs_to :warehouse
  belongs_to :sku

  validates :site_id, :warehouse_id, :sku_id, :nomember_price, :member_price, presence: true
  validates :sku_id, uniqueness: {
    scope: [:site_id, :warehouse_id],
    message: '已存在该平台、仓库下的价格记录'
  }
  validates :nomember_price, :member_price, numericality: {
    greater_than_or_equal_to: 0,
  }

  def face_price
    FacePrice.find_by(site_id: self.site_id, sku_id: self.sku_id)
  end
end
