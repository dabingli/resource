# == Schema Information
#
# Table name: base_units
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BaseUnit < ActiveRecord::Base
  has_many :product_category_base_units
end
