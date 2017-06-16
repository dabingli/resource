# == Schema Information
#
# Table name: product_image_categories
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductImageCategory < ActiveRecord::Base
	has_many :product_images

  # 素材管理中可以管理的分类
  def self.material_categories
    ProductImageCategory.order(:position)
  end
end
