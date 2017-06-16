# == Schema Information
#
# Table name: baby_managements
#
#  id         :integer          not null, primary key
#  product_id :integer
#  sku        :string
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BabyManagement < ApplicationRecord
  belongs_to :sku
end
