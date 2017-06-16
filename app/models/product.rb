# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  product_category_id :integer
#  product_no          :string
#  name                :string
#  description         :text
#  spec                :string
#  brand               :string
#  water_absrp_rate_id :integer
#  thickness           :decimal(, )
#  shape_id            :integer
#  color_id            :integer
#  cases_per_pallet    :integer
#  unit_weight         :decimal(, )
#  unit_area           :decimal(, )
#  package_weight      :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  surface_craft_id    :integer
#  base_unit_id        :integer
#  business_unit_id    :integer
#  material_id         :integer
#  packing_unit        :integer
#  tabtype             :string
#

class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :rim_category
  belongs_to :material
  belongs_to :surface_craft
  belongs_to :water_absrp_rate
  belongs_to :shape
  belongs_to :color
  belongs_to :product_style
  belongs_to :product_use_place
  belongs_to :flush_method
  belongs_to :drainage_method
  belongs_to :flush_volume
  belongs_to :pits_distance
  belongs_to :spec_size
  belongs_to :installation_method
  belongs_to :tap_hole
  belongs_to :mesa_style
  belongs_to :main_cabinet_range
  belongs_to :mirror_cabinet_range
  belongs_to :side_cabinet_range
  belongs_to :door_opening_method
  belongs_to :flush_control_method
  belongs_to :chassis_material
  belongs_to :glass_varieties
  belongs_to :shower_faucet_style
  belongs_to :base_unit
  belongs_to :business_unit
  belongs_to :shower_type_bracket
  belongs_to :spool_style
  belongs_to :slot_number
  belongs_to :ancillary_incidental
  belongs_to :outlet_direction
  belongs_to :package_method
  belongs_to :whole_material
  belongs_to :glass_thickness
  belongs_to :water_temperature
  belongs_to :take_temperature
  belongs_to :power
  belongs_to :additional_function
  belongs_to :safety_device
  belongs_to :capacity
  belongs_to :seat_power
  belongs_to :lid
  belongs_to :appearance
  belongs_to :thickness
  belongs_to :product_structure
  belongs_to :product_fabric
  belongs_to :surface_gloss
  belongs_to :spring_structure
  belongs_to :seat_comfort
  belongs_to :product_type
  has_many :skus, dependent: :destroy
  has_many :product_languages, dependent: :destroy
  belongs_to :voltage_level
  belongs_to :applicable_space
  belongs_to :light_material
  belongs_to :light_attachment
  belongs_to :lampshade_material
  belongs_to :lampshade_attachment
  belongs_to :lamp_technology
  belongs_to :source_category
  belongs_to :spatial_range
  belongs_to :suitable_storey
  belongs_to :light_category
  belongs_to :color_temperature
  belongs_to :lumen
  belongs_to :feature
  belongs_to :base_type
  belongs_to :light_quantity
  belongs_to :buckle_type
  belongs_to :chamfering_process
  belongs_to :wax_process
  belongs_to :eco_level
  

  validates :product_category_id, :product_no, presence: true
  validates :product_no, uniqueness: true

  # 同时保存多语言信息
  accepts_nested_attributes_for :product_languages

  # 要维护的语言
  # 中文除外
  MAINTAINED_LANGUAGES = Language.where('"foreign" != ?', 'zh-CN').order(:position)

  # 获取指定语言的记录，用于产品表单
  # 若不存在，新建一个
  def language_record(language_id)
    if new_record?
      product_languages.build(language_id: language_id)
    else
      product_languages.find_or_initialize_by(language_id: language_id)
    end
  end

  # 直接产品分类及其祖先分类
  # 按分类的 level 由低到高排列
  def product_categories
    if product_category
      product_category.ancestor_categories.reverse << product_category
    else
      []
    end
  end

  def product_categories_text
    product_categories.map(&:name).join(' - ')
  end
end
