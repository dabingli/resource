class ProductHall < ApplicationRecord
	has_many :product_hall_skus, dependent: :destroy

	validates :site_id, presence: true

  # 包含的产品所属的分类
  def product_categories
    category_ids = Product.joins(skus: :product_hall_skus).
        where("product_hall_skus.product_hall_id = ?", self.id).
        select(:product_category_id).
        distinct

    ProductCategory.where(id: category_ids)
  end

  # 包含的产品所属的分类，及祖先分类
  def all_product_categories
    categories = self.product_categories.includes(:parent).to_a

    # 循环中增加了元素，若用 each 会受影响
    categories.size.times do |i|
      category = categories[i]
      while category.parent
        categories << category.parent
        category = category.parent
      end
    end

    categories.uniq
  end
end
