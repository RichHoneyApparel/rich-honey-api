class Api::V1::ProductController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :html, :json

  def index
    respond_with Product.all
  end

  def show
    respond_with Product.find(params[:id])
  end
end
