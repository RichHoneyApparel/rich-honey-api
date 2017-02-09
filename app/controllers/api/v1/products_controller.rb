class Api::V1::ProductsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with Product.all, include: %w(product_property product_production_statuses)
  end

  def show
    respond_with Product.find(params[:id])
  end

  def create
    product = Product.create(product_params)

    if product.save
      render json: product, include: %w(product_property product_production_statuses), status: 201, location: [:api, product]
    else
      render json: { error: product.errors }, status: 422
    end
  end

  def product_params
    params.require(:product).permit(:id, :name, :price, :qty,
            product_property_attributes: [:id, :product_id, :gender, :category, :dye, :wash, :fabric],
            product_production_statuses_attributes: [:id, :product_id, :name, :description, :state])
  end
end
