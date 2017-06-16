# == Schema Information
#
# Table name: shapes
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shape < ActiveRecord::Base
  has_many :product_category_shapes
end
