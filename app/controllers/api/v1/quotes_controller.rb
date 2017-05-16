class Api::V1::QuotesController < ApplicationController
  respond_to :html, :json

  def index
    respond_with Quote.all
  end

  def show
    respond_with Quote.find(params[:id])
  end

  def create
    quote = Quote.create(quote_params)
    if quote.save
      render json: quote, include: %w(size_breakdown label hangtag), status: 201, location: [:api, quote]
    else
      render json: { error: quote.errors }, status: 422
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:product_name, :product_style_num, :qty,
            :fabric, :color, :dye, :note, :gender, size_breakdown_attributes: [
              :quote_id, :xs, :s, :m, :l, :xl, :xxl
            ], label_attributes: [:sewing, :creation], hangtag_attributes: [
              :placement, :creation
            ])
  end
end
