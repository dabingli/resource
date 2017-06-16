class GuidesController < ApplicationController
  def index
  	@guide = Guide.new
  end 

  def create
  	code = 1
  	@guide = Guide.find_or_initialize_by(product_category_id: params[:id])
  	@guide.solution = params[:solution]
  	if @guide.save
  		code = 0
  	end
  	render json: {
  		code: code,
  		data: @guide.solution
  	}
  end

  def tree
  	code = 0
  	guide = Guide.find_or_initialize_by(product_category_id: params[:id])
  	if guide.id.blank?
  		code = 1
  	end
  	render json: {
  		code: code,
  		data: guide.solution
  	}
  end
end