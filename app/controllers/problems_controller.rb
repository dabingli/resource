class ProblemsController < ApplicationController
  def index
  	@problem = Problem.new
  end 

  def create
  	code = 1
  	@problem = Problem.find_or_initialize_by(product_category_id: params[:id])
  	@problem.solution = params[:solution]
  	if @problem.save
  		code = 0
  	end
  	render json: {
  		code: code,
  		data: @problem.solution
  	}
  end

  def tree
  	code = 0
  	problem = Problem.find_or_initialize_by(product_category_id: params[:id])
  	if problem.id.blank?
  		code = 1
  	end
  	render json: {
  		code: code,
  		data: problem.solution
  	}
  end

  private
  def problem_params
    params.require(:problem).permit(:product_category_id, :solution)
  end
end
