class ExportPricesController < ApplicationController
  before_action :validate_params, only: [:create]
  before_action :validate_price, only: [:single_price]

  def index
    params[:search] = {} unless params[:search].respond_to?(:[])
    # 同时支持 params[:search][:product_category_id], params[:product_category_id]
    product_category_id = (
      params[:search][:product_category_id].presence ||
      params[:product_category_id].presence
    ).to_i

    @product_category = ProductCategory.find(product_category_id)
    search_params = params[:search].to_unsafe_h.
                                    stringify_keys.
                                    except('product_category_id').
                                    reject { |_, value| value.blank? }

    # rails-simple-search 中是否已经 join products 表
    products_table_joined = search_params.keys.any? { |key| key.include?('product.') }
    @search = Search.new(Sku, search_params)
    @skus = @search.run.
                    includes(:product, :export_prices).
                    joins(products_table_joined ? nil : :product).
                    where(
                      'products.product_category_id' =>
                        @product_category.id_and_offspring_category_ids
                    ).
                    order(updated_at: :desc).
                    paginate(page: params[:page], per_page: 20)

    params[:search][:product_category_id] = @product_category.id
    @search = Search.new(Sku, params[:search])
  end

  # 添加或更新
  def create
    ExportPrice.transaction do
      PriceUnit.ids.each do |price_unit_id|
        record = ExportPrice.find_or_initialize_by(
          sku_id: @sku.id,
          price_unit_id: price_unit_id
        )
        record.attributes = price_params(price_unit_id)
        record.active = @price_unit_id == price_unit_id
        unless record.save
          return render json: {
            code: 1,
            msg: record.errors.full_messages.first,
          }
        end
      end
    end


    render json: {
      code: 0,
    }
  end
  #卫浴\五金添加或更新
  def single_price
    ExportPrice.transaction do
      record = ExportPrice.find_or_initialize_by(sku_id: @sku_id)
      record.attributes = exprot_price_params
      unless record.save
        return render json: {
          code: 1,
          msg: record.errors.full_messages.first,
        }
      end
    end

    render json: {
      code: 0,
    }
  end

  protected

  # 解析、验证参数
  def validate_params
    # params[:active_price_unit] 须为 sku_id => price_unit_id
    if params[:active_price_unit].is_a?(Hash) && params[:active_price_unit].size == 1 &&
           PriceUnit.ids.include?(params[:active_price_unit].values.first.to_i)

      sku_id, price_unit_id = params[:active_price_unit].first
      @sku = Sku.find_by id: sku_id
      @price_unit_id = price_unit_id.to_i
      if @sku.nil?
        return render json: {
          code: 1,
          msg: 'SKU 不存在',
        }
      end
    else
      return render json: {
        code: 1,
        msg: '价格单位错误',
      }
    end

    unless params[:price_unit].is_a?(Hash)
      return render json: {
        code: 1,
        msg: '价格错误',
      }
    end

    PriceUnit.ids.each do |id|
      unless params[:price_unit][id.to_s].is_a?(Hash)
        return render json: {
          code: 1,
          msg: '价格错误',
        }
      end
    end
  end
  # 解析、验证卫浴\五金参数
  def validate_price
    @sku_id = params[:sku_id]
    if @sku_id.nil?
      return render json: {
        code: 1,
        msg: 'SKU 不存在',
      }
    end
  end

  def price_params(price_unit_id)
    params[:price_unit][price_unit_id.to_s].permit(:price, :nomember_price, :member_price)
  end

  def exprot_price_params
    params[:price_unit].permit(:price, :nomember_price, :member_price)
  end
end
