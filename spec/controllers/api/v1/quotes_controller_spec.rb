require 'rails_helper'

RSpec.describe Api::V1::QuotesController, type: :controller do
  describe 'Get all quotes' do
    before(:each) do
      @quotes = FactoryGirl.create_list(:quote, 20)
      get :index, format: :json
    end

    it 'returns 20 quotes' do
      expect(@quotes.length).to_not eq(0)
    end
  end

  describe 'Get a quote' do
    before(:each) do
      @quote = FactoryGirl.create(:quote)
      get :show, id: @quote.id, format: :json
    end

    it 'returns the information of a quote' do
      quote_response = json_response
      expect(quote_response[:product_name]).to eql @quote.product_name
    end

    it { should respond_with 200 }
  end

  describe 'Create new quote' do
    context 'when quote is successfully created' do
      before(:each) do
        @quote_attributes = FactoryGirl.attributes_for(:quote)
        post :create, quote: @quote_attributes
      end

      it 'renders the json representation for the quote just created' do
        quote_response = json_response
        expect(quote_response[:name]).to eql @quote_attributes[:name]
      end

      it { should respond_with 201 }
    end
  end
end
