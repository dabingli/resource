class SessionsController < ApplicationController
  skip_before_filter :authorize
  layout 'login'

  def new
  end

  def create
    user = User.find_by(employee_number: params[:employee_number])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id

      render json: {
        code: 0,
        url: params[:redirect_url].presence || root_path,
      }
    else
      render json: {
        code: 1,
      }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
