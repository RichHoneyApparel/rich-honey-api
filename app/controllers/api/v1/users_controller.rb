class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :html, :json

  def index
    respond_with User.all, include: %w(business address)
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
    user_params = params.require(:user).permit(:email, :password, :password_confirmation,
                  :first_name, :last_name, :phone, :username,
                  business_attributes: [:id, :business_name,
                    :business_type, :business_email, :business_url, :business_phone,
                    :business_fax, :heard_about_us, :federal_tax_id, :state_sales_tax_license,
                    :product_resold, :product_decorated, :garment_decorated,
                    ], address_attributes: [:address_1, :address_2, :state, :country, :city, :zip])

    user_params.delete(:password) unless user_params[:password].present?
    user_params.delete(:password_confirmation) unless user_params[:password_confirmation].present?

    user_params
  end
end
