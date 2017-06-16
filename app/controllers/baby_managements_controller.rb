class BabyManagementsController < ApplicationController
  before_action :set_baby_management, only: [:show, :edit, :update, :destroy]

  # GET /baby_managements
  def index
    params[:search] = {} unless params[:search].is_a? Hash

    @search = Search.new(BabyManagement, params[:search])
    @baby_managements = @search.run.
                    includes(sku: {product: [:product_category]}).
                    order(updated_at: :desc).
                    paginate(page: params[:page], per_page: 20)
    @sites = Site.all
  end

  # PATCH/PUT /baby_managements/1
  # PATCH/PUT /baby_managements/1.json
  def update
    baby_no = params[:baby_no]
    #编辑宝贝编号
    BabyManagement.update(params[:id], :baby_no => baby_no)
    respond_to do |format|
      flash[:success] = '宝贝编号编辑完成'
      format.html { redirect_to baby_managements_path(site_id:params[:site_id]) }
    end
  end

  # GET /baby_managements/:id/site_skus
  def site_skus
    result = []
    result = SiteSku.where(sku_id:params[:sku_id]).map(&:site_id)
    render json: {
      code: 0,
      data: result,
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baby_management
      if params[:baby_id]
        params[:id] = params[:baby_id]
      end
      @baby_management = BabyManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baby_management_params
      params.require(:baby_management).permit(:baby_no)
    end
end
