class ProductHallsController < ApplicationController
  def index
    @sites = Site.all.includes(:product_halls)
  end
end
