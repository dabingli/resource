class Api::V1::CategoryAttributesController < Api::V1::BaseController

  def index
    category_id = params[:category_id].present? ? params[:category_id].to_i : nil
    product_field = ProductField.where(product_category_id: category_id)

    render json: product_field.map { |record| record }
  end
end
