class ProductImagesController < ApplicationController
  before_action :set_sku, only: [:show, :update]
  before_action :set_product, only: [:creatable_skus, :create]

  # GET /product_images
  def index
    @search = Search.new(Sku, params[:search])
    @skus = @search.run.
                    includes(product: [:product_category]).
                    order(updated_at: :desc).
                    paginate(page: params[:page], per_page: 20)
  end

  # GET /product_images/:sku_id
  def show
    images = @sku.product_images.order(:position).includes(:image)

    # product_image_category_id => [{id: 1, url: ''}]
    result = {}

    images.map(&:product_image_category_id).uniq.each do |category_id|
      result[category_id] = images.select do |record|
        record.image && record.product_image_category_id == category_id
      end.map { |record| {id: record.id, url: record.image.image_url} }
    end

    render json: {
      code: 0,
      data: result,
    }
  end

  # 获取可添加的 SKU，用于添加素材时的等级下拉框
  # GET /product_images/creatable_skus?product_id=1
  def creatable_skus
    result = (Sku::LEVEL_TO_TEXT.keys - @product.skus.pluck(:level)).inject({}) do |h, level|
      h[level] = Sku::LEVEL_TO_TEXT[level]
      h
    end

    render json: {
      code: 0,
      data: result,
    }
  end

  # 新增 SKU 并保存图片
  # POST /product_images
  def create
    @sku = @product.skus.build params[:sku].permit(:level)
    update_images
  end

  # 更新 SKU 的图片
  # PATCH/PUT /product_images/:sku_id
  def update
    update_images
  end

  private

  def set_sku
    @sku = Sku.find params[:sku_id]
  end

  def set_product
    product_id = params[:product_id].presence
    if !product_id
      return render json: {
        code: 1,
        msg: '缺少 product_id 参数'
      }
    elsif !@product = Product.find_by(id: product_id)
      render json: {
        code: 1,
        msg: '商品不存在'
      }
    end
  end

  def update_images
    error = nil
    ProductImage.transaction do
      # 添加素材时需先保存
      unless @sku.save
        error = @sku.errors.full_messages.first
        raise ActiveRecord::Rollback
      end

      product_images = @sku.product_images.load

      # 避免一张图片都没有时出错
      params[:images] = {} unless params[:images].presence.is_a?(Hash)

      # 删除整个分类的图片
      deleted_category_ids = product_images.map(&:product_image_category_id) - params[:images].keys.map(&:to_i)
      unless deleted_category_ids.blank?
        product_images.where(product_image_category_id: deleted_category_ids).delete_all
      end

      # 逐个分类处理
      params[:images].each do |category_id, images|
        # 字符串转为数值，便于后续使用
        category_id = category_id.to_i
        images = images.map do |image|
          if image.is_a?(String) && image =~ /^\d+$/
            image.to_i
          else
            image
          end
        end

        # 删除图片
        deleted_ids = product_images.select do |record|
          record.product_image_category_id == category_id
        end.map(&:id).uniq - images

        unless deleted_ids.blank?
          ProductImage.where(id: deleted_ids).delete_all
        end

        # 添加/更新图片
        # image 可能是 id，或文件
        images.each_with_index do |image, index|
          position = index + 1
          # 添加
          if image.respond_to? :tempfile
            product_image = ProductImage.new({
              sku_id: @sku.id,
              product_image_category_id: category_id,
              position: position,
              image_file: image,
            })

            unless product_image.save
              error = product_image.errors.full_messages.first
              raise ActiveRecord::Rollback
            end
          # 更新
          else
            product_image = ProductImage.find_by id: image
            unless product_image
              error = "商品图片 #{image} 不存在"
              raise ActiveRecord::Rollback
            end
            unless product_image.update position: position
              error = product_image.errors.full_messages.first
              raise ActiveRecord::Rollback
            end
          end
        end
      end
    end

    if error
      render json: {
        code: 1,
        msg: error,
      }
    else
      render json: {
        code: 0,
      }
    end
  end
end
