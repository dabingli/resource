class SiteSkusController < ApplicationController
  before_action :set_sku, only: [:site_skus, :update_site_skus]

  # GET /site_skus
  # 展示 sku 列表及每个 sku 的上架状态
  def index
    @search = Search.new(Sku, params[:search])
    @skus = @search.run.
                    includes(:product_halls, product: [:product_category], site_skus: [:site]).
                    order(updated_at: :desc).
                    paginate(page: params[:page], per_page: 20)

    @sites = Site.all.includes(:product_halls)
  end

  # GET /skus/:sku_id/site_skus
  # 获取 sku 的上架状态（上架的平台及每个平台的商品馆）
  # 返回 { sku_id => [product_hall_id,]}
  def site_skus
    product_halls = @sku.product_halls.to_a

    result = {}
    @sku.site_skus.each do |site_sku|
      result[site_sku.site_id] = product_halls.select do |product_hall|
        product_hall.site_id == site_sku.site_id
      end.map(&:id)
    end

    render json: {
      code: 0,
      data: result,
    }
  end

  # PUT /skus/:sku_id/site_skus
  # 更新 sku 的上架状态（上架的平台及每个平台的商品馆）
  def update_site_skus
    site_ids = params[:site_ids].presence || []
    product_hall_ids = params[:product_hall_ids].presence || {}

    # 确保参数合法
    unless site_ids.is_a?(Array) &&
           product_hall_ids.is_a?(Hash) &&
           product_hall_ids.values.all? { |ids| ids.is_a?(Array) }
      return render json: {
        code: 1,
        msg: '参数错误',
      }
    end

    @sku.transaction do
      @sku.site_ids = site_ids
      @sku.product_hall_ids = product_hall_ids.slice(*site_ids).values.flatten
    end

    render json: {
      code: 0,
    }
  end

  private

  def set_sku
    @sku = Sku.find(params[:sku_id])
  end
end
