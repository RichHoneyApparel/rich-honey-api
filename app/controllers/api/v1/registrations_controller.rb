class RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      allow = [:email, :password, :password_confirmation,
                :first_name, :last_name, :phone, :username,
                [business_attributes: [:id, :business_name,
                  :business_type, :business_email, :business_url, :business_phone,
                  :business_fax, :heard_about_us, :federal_tax_id, :state_sales_tax_license,
                  :product_resold, :product_decorated, :garment_decorated,
                  address_attributes: [:address_1, :address_2, :state,
                    :country, :city, :zip]]]]
      params.require(resource_name).permit(allow)
    end

    def after_sign_out_path_for(resource_or_scope)
      render.json(:user)
    end
end
