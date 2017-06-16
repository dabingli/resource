# == Schema Information
#
# Table name: surface_crafts
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SurfaceCraft < ActiveRecord::Base
  has_many :product_category_surface_crafts
end
