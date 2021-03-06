class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_with_token!, except: [:create]
  before_action :is_authorized?, except: [:create, :index]

  def index
    if current_user.user?
      @users = User.where('id = ?',current_user.id)
    else
      @users = User.all
    end
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user != current_user && @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :access_level)
    end

    def is_authorized?
      head :unauthorized unless current_user.admin? || current_user.agent? || (current_user == @user )
    end
end
