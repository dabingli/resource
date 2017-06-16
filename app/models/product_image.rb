# == Schema Information
#
# Table name: product_images
#
#  id                        :integer          not null, primary key
#  position                  :integer
#  image_id                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  series                    :text
#  size                      :string
#  product_image_category_id :integer
#  sku_id                    :integer
#

class ProductImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :sku
  belongs_to :product_image_category

  attr_accessor :image_file

  validates :sku_id, :product_image_category_id, :position, presence: true
  validate :must_have_image

  before_save :save_image

  protected

  def must_have_image
    if !self.image && !self.image_file
      if self.image_id
        self.errors.add :base, '关联的图片不存在'
      else
        self.errors.add :base, '图片不能为空'
      end
    end
  end

  def save_image
    if self.image_file
      self.image = Image.find_or_create(self.image_file)
      unless self.image.persisted?
        self.errors.add :base, "保存图片失败：#{self.image.errors.full_messages.first}"
        raise ActiveRecord::Rollback
      end
    end
  end
end
