class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  def index
    if @current_user.admin?
      redirect_to users_url
    else
      redirect_to products_url
    end
  end

  protected

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    return if @current_user
    redirect_to login_path(redirect_url: request.original_url)
  end
end
