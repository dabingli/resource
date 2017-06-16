# == Schema Information
#
# Table name: skus
#
#  id         :integer          not null, primary key
#  product_id :integer
#  level      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sku < ApplicationRecord
  belongs_to :product
  has_many :product_images, dependent: :destroy
  has_many :site_skus, -> {order(:site_id)}, dependent: :destroy
  has_many :sites, through: :site_skus
  has_many :product_hall_skus
  has_many :product_halls, through: :product_hall_skus
  has_many :domestic_prices, dependent: :destroy
  has_one :face_price, dependent: :destroy
  has_many :export_prices, dependent: :destroy
  has_one :baby_management, dependent: :destroy

  accepts_nested_attributes_for :product_images
  accepts_nested_attributes_for :site_skus

  validates :product_id, :level, presence: true
  validates :product_id, uniqueness: {
    scope: :level,
    message: 'SKU 已存在',
  }

  after_create :add_baby_management_record

  def add_baby_management_record
    self.create_baby_management
  end

  LEVEL_TO_TEXT = {
    'A' => 'AAA',
    'B' => '一级品',
    'C' => '合格品',
    'D' => '四级品',
  }

  # 片价
  def piece_export_price
    @piece_export_price ||= self.export_prices.to_a.find {|record| record.price_unit_id == 1}
  end

  # 方价
  def sqm_export_price
    @sqm_export_price ||= self.export_prices.to_a.find {|record| record.price_unit_id == 2}
  end

  # 当前使用的价格单位
  def active_export_price_unit_id
    self.export_prices.to_a.find {|record| record.active? }&.price_unit_id
  end

  #export_price卫浴五金
  def export_pri
    @export_pri ||= self.export_prices.to_a.find{|record| record.price_unit_id == nil}
  end

  # 第一张图片。商品管理页面使用
  def first_image_url
    Image.joins(:product_images).find_by(product_images: {sku_id: self.id})&.image_url
  end

  def level_text
    LEVEL_TO_TEXT[self.level] || ''
  end

  # 所有图片
  # 可传递需要的图片分类名称进行筛选
  def images(categories = nil)
    fields = [
      'images.url',
      'product_image_categories.name AS category_name',
    ]

    where = {
      'product_images.sku_id' => self.id,
    }

    if categories
      where['product_image_categories.name'] = Array(categories)
    end

    result = ProductImage.select(fields).
      joins(:image, :product_image_category).
      where(where).
      order('product_image_categories.position ASC, product_images.position ASC').
      map do |record|
        {
          type: record.category_name,
          url: record.url,
        }
      end

    if self.product&.root_product_category_id
      SeriesImage.select('images.url').
        joins(:image).
        where({
          product_category_id: self.product.root_product_category_id
        }).
        each do |record|
          result << {
            type: '系列图',
            url: record.url,
          }
        end
    end

    result
  end

  # 正面图
  def front_view_image
    record = ProductImage.select('images.url').
              joins(:image).
              where(product_image_category_id: 1, sku_id: self.id).
              order('images.updated_at DESC').
              first

    if record.nil?
      nil
    else
      record.url
    end
  end

end
