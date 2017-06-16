# == Schema Information
#
# Table name: site_skus
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  sku        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  selected   :boolean
#

class SiteSku < ActiveRecord::Base
  belongs_to :sku
  belongs_to :site
end
