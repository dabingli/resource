class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :set_product_category, only: [:index, :suit]
  before_action :search, only: [:index, :suit]

  # 非套装
  # GET /products
  def index
  end

  # 套裝
  # GET /products/suit
  def suit
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    unless request.params[:product_no].blank?
      product = Product.find_by_product_no(request.params[:product_no])
      unless product.blank?
        redirect_to :action => 'edit', :id => product.id 
      else
      @product = Product.new(product_category_id: request.params[:product_category_id], product_no: request.params[:product_no])
      end
    else
      if session[:last_product_record].blank?
        @product = Product.new(product_category_id: params[:product_category_id])
      else
        session[:last_product_record]['product_category_id'] = params[:product_category_id]
        @product = Product.new(session[:last_product_record])
      end
    end
  end

  # GET /products/1/edit
  def edit
    unless request.params[:product_no].blank?
      @product = Product.find_by_product_no(request.params[:product_no])
    end
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      session[:last_product_record] = product_params.dup
      render json: {
        code: 0,
        url: product_path(@product),
      }
    else
      render json: {
        code: 1,
        msg: @product.errors.full_messages.first,
      }
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update product_params
      render json: {
        code: 0,
        url: product_path(@product),
      }
    else
      render json: {
        code: 1,
        msg: @product.errors.full_messages.first,
      }
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    if @product.destroyed?
      render json: {
        code: 0,
      }
    else
      render json: {
        code: 1,
        msg: @product.errors.full_messages.first,
      }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_product_category
    params[:search] = {} unless params[:search].respond_to?(:[])
    # 同时支持 params[:search][:product_category_id], params[:product_category_id]
    product_category_id = (
      params[:search][:product_category_id].presence ||
      params[:product_category_id].presence
    ).to_i

    if product_category_id <= 0
      default_category = ProductCategory.top_id(action_name == 'index' ? :tiles : :bathing)
      return redirect_to(suit_products_path(product_category_id: default_category))
    else
      @product_category = ProductCategory.find product_category_id
    end
  end

  def product_params
    product_fields = Product.column_names - ['id', 'created_at', 'updated_at']
    language_fields = ['id', 'language_id', 'name', 'description', 'brand']
    params.require(:product).permit(
      *product_fields,
      product_languages_attributes: language_fields
    )
  end

  def search
    params[:search][:product_category_id] ||= params[:product_category_id]
    search_params = params[:search].to_unsafe_h.stringify_keys.except('product_category_id')
    @search = Search.new(Product, search_params)

    category_ids = @product_category.id_and_offspring_category_ids
    @products = @search.run.
                        where(product_category_id: category_ids).
                        includes(:product_category, :skus).
                        order(updated_at: :desc).
                        paginate(page: params[:page], per_page: 20)


    @search = Search.new(Product, params[:search])
    p_c = params[:search][:product_category_id].to_i
    find_parent(p_c)
  end
  def find_parent(par_id)
    parent_id = ProductCategory.find(par_id).parent_id
    if parent_id.nil?
      @search.product_category_id = par_id
    else
      par_id = parent_id
      find_parent(par_id)
    end
  end
end
