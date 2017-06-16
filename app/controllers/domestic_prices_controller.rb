class DomesticPricesController < ApplicationController
  before_action :set_domestic_price, only: [:show, :edit, :update, :destroy]
  before_action :validate_sku_params, only: [:create]

  # GET /domestic_prices
  def index
    @search = Search.new(DomesticPrice, params[:search])
    query = @search.run.
                    includes(:site, :warehouse, sku: [:product]).
                    order(updated_at: :desc).
                    paginate(page: params[:page], per_page: 20)

    price_type = params[:price_type].presence
    min_price = params[:min_price].presence
    max_price = params[:max_price].presence

    if price_type && (min_price || max_price)
      case price_type
      when 'nomember_price', 'member_price'
        price_field = "domestic_prices.#{price_type}"
      else
        price_field = nil
      end

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

    @domestic_prices = query

    @sites = Site.all
    @warehouses = Warehouse.all
  end

  # GET /domestic_prices/1
  def show
  end

  # GET /domestic_prices/new
  def new
    product = Product.find params[:product_id]
    sku = product.skus.build
    @domestic_price = DomesticPrice.new(sku: sku)

    @levels = Sku::LEVEL_TO_TEXT.to_a.map(&:reverse)
    @warehouses = Warehouse.pluck :name, :id
    @sites = Site.domestic.pluck :name, :id

  end

  # GET /domestic_prices/1/edit
  def edit
    @domestic_price = DomesticPrice.includes(sku: [:product]).find params[:id]

    @levels = Sku::LEVEL_TO_TEXT.to_a.map(&:reverse)
    @warehouses = Warehouse.pluck :name, :id
    @sites = Site.domestic.pluck :name, :id
  end

  # POST /domestic_prices
  def create
    sku = Sku.find_or_initialize_by(sku_params)
    domestic_price = DomesticPrice.new domestic_price_params

    error = nil
    DomesticPrice.transaction do
      unless sku.save
        error = sku.errors.full_messages.first
        raise ActiveRecord::Rollback
      end

      domestic_price.sku_id = sku.id
      unless domestic_price.save
        error = domestic_price.errors.full_messages.first
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
        url: domestic_price_path(domestic_price, redirect_to: params[:redirect_to]),
      }
    end
  end

  # PATCH/PUT /domestic_prices/1
  def update
    DomesticPrice.transaction do
      unless @domestic_price.update domestic_price_params
        return render json: {
          code: 1,
          msg: @domestic_price.errors.full_messages.first,
        }
      end

    end

    render json: {
      code: 0,
      url: domestic_prices_path,
    }
  end

  # DELETE /domestic_prices/1
  def destroy
    if @domestic_price.destroy
      render json: {
        code: 0,
      }
    else
      render json: {
        code: 1,
        msg: @domestic_price.errors.full_messages.first,
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domestic_price
      @domestic_price = DomesticPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domestic_price_params
      params.require(:domestic_price).permit(
        :nomember_price,
        :member_price,
        :warehouse_id,
        :site_id,
      )
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

  end
