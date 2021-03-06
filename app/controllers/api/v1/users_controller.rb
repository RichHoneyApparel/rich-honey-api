class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :html, :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { error: user.errors }, status: 422
    end
  end

  def update
    user = current_user

    if user.update(user_params)
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

  def user_params
    user_params = params.require(:user).permit(:email, :password, :password_confirmation)

    user_params.delete(:password) unless user_params[:password].present?
    user_params.delete(:password_confirmation) unless user_params[:password_confirmation].present?

    user_params
  end
end
