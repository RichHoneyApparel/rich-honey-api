require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = 'application/vnd.rich-honey-api.v1' }

  describe 'GET #show' do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id, format: :json
    end

    it 'returns the information about a reporter on a hash' do
      user_response = json_response
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe 'POST #create user' do
    context 'when user is successfully created' do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }, format: :json
      end

      it 'renders the json representation for the user record just created' do
        user_response = json_response
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context 'when user is not created' do
      before(:each) do
        @invalid_user_attributes = { password: '12345678', password_confirmation: '12345678' }
        post :create, { user: @invalid_user_attributes }, format: :json
      end

      it 'renders an error' do
        user_response = json_response
        expect(user_response).to have_key(:error)
      end

      it 'render error reason' do
        user_response = json_response
        expect(user_response[:error][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe 'PUT #update user' do
    context 'when user is successfully created' do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }, format: :json
      end

      it 'renders the json representation for the user record just created' do
        user_response = json_response
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context 'when user is not created' do
      before(:each) do
        @invalid_user_attributes = { password: '12345678', password_confirmation: '12345678' }
        post :create, { user: @invalid_user_attributes }, format: :json
      end

      it 'renders an error' do
        user_response = json_response
        expect(user_response).to have_key(:error)
      end

      it 'render error reason' do
        user_response = json_response
        expect(user_response[:error][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe 'DELETE #destroy user' do
    before(:each) do
      @user = FactoryGirl.create :user
      delete :destroy, { id: @user.id }, format: :json
    end

    it { should respond_with 204 }
  end
end
