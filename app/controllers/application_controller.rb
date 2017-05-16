# Main application contrller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  respond_to :html, :json
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Authenticable

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :username, :phone, :password,
              :password_confirmation, business_attributes: [
                :business_name, :business_type, :business_email, :business_url,
                :business_phone, :business_fax, :heard_about_us,
                :business_federal_tax_id, :business_state_sales_tax_license,
                :product_resold, :product_decorated, :garment_decorated
              ],
              address_attributes: [
                :address_1, :address_2, :state, :country, :city, :zip])
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    render.json(:user)
  end
end
