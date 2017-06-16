# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Site < ActiveRecord::Base
  has_many :domestic_price
  has_many :product_halls

  # 国内网站
  scope :domestic, -> { where(domestic: true) }
end
