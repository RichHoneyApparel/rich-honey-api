require 'rails_helper'

describe Api::V1::ProductsController do
  describe 'Get all products' do
    before(:each) do
      @products = FactoryGirl.create_list(:product, 20)
      get :index, format: :json
    end

    it 'returns 20 products' do
      expect(@products.length).to_not eq(0)
    end
  end

  describe 'Get a product' do
    before(:each) do
      @product = FactoryGirl.create(:product)
      get :show, id: @product.id, format: :json
    end

    it 'returns the information about a reporter on a hash' do
      product_response = json_response
      expect(product_response[:name]).to eql @product.name
    end

    it { should respond_with 200 }
  end

  describe 'create a product' do
    context 'when product is successfully created' do
      before(:each) do
        @product_attributes = FactoryGirl.attributes_for(:product)
        post :create, { product: @product_attributes }
      end

      it 'renders the json representation for the user record just created' do
        product_response = json_response
        expect(product_response[:name]).to eql @product_attributes[:name]
      end

      it { should respond_with 201 }
    end
  end
end
