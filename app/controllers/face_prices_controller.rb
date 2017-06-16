class FacePricesController < ApplicationController
	before_action :set_face_price , only: [:show, :edit, :update, :destroy]
  before_action :validate_sku_params , only:[:create]
  def index
  	@search = Search.new(FacePrice, params[:search])
    query = @search.run.
                    includes(sku: [:product]).
                    order(updated_at: :desc).
                    paginate(page: params[:page], per_page: 20)

    price_type = params[:price_type].presence
    min_price = params[:min_price].presence
    max_price = params[:max_price].presence

    if price_type && (min_price || max_price)

      price_field = price_type

      if price_field
        if min_price && max_price
          query = query.where("#{price_field} >= ? AND #{price_field} <= ?", min_price, max_price)
        elsif min_price
          query = query.where("#{price_field} >= ?", min_price)
        else
          query = query.where("#{price_field} <= ?", max_price)
        end
      end
    end


  	@face_prices = query
  end

  def new
  	product = Product.find params[:product_id]
  	sku = product.skus.build
  	@face_price = FacePrice.new(sku: sku)

  	@levels = Sku::LEVEL_TO_TEXT.to_a.map(&:reverse)
  end

  def show

  end

  def edit
  end

  def create
  	sku = Sku.find_or_initialize_by(sku_params)
    if sku.new_record?
      face_price = FacePrice.new(face_price_params)
    else
      face_price = FacePrice.find_or_initialize_by sku_id: sku.id
      face_price.attributes = face_price_params
    end

    error = nil
    FacePrice.transaction do
      unless sku.save
        error = sku.errors.full_messages.first
        raise ActiveRecord::Rollback
      end

      face_price.sku_id = sku.id
      unless face_price.save
        error = face_price.errors.full_messages.first
        raise ActiveRecord::Rollback
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
          url: face_prices_path(face_price)
        }
      end
  end

  def update
  	if @face_price.update(face_price_params)
      render json: {
        code: 0,
        url: face_prices_path,
      }
    else
      render json: {
        code: 1,
        msg: @face_price.errors.full_messages.first,
      }
    end
  end

  private
  def set_face_price
  	@face_price = FacePrice.find(params[:id])
  end

  def validate_sku_params
      unless params[:sku].try(:[], :product_id).presence
        return render json: {
          code: 1,
          msg: 'product_id 不能为空'
        }
      end

      unless params[:sku].try(:[], :level).presence
        return render json: {
          code: 1,
          msg: '等级不能为空'
        }
      end
    end

  def sku_params
    params.require(:sku).permit(:product_id, :level)
  end

  def face_price_params
      params.require(:face_price).permit(:sku_id, :price, :store_price)
    end
end
