class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {
        code: 0,
        url: users_path,
      }
    else
      render json: {
        code: 1,
        msg: @user.errors.full_messages.first,
      }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: {
        code: 0,
        url: users_path,
      }
    else
      render json: {
        code: 1,
        msg: @user.errors.full_messages.first,
      }
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: {
      code: 0,
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:employee_number, :name, :mobile, :admin, :password, :password_confirmation)
    end
end
