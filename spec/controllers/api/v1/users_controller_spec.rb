require 'rails_helper'

describe Api::V1::UsersController do
  describe 'Get all users' do
    before(:each) do
      @users = FactoryGirl.create_list(:user, 10)
      get :index, format: :json
    end

    it 'returns all the users' do
      expect(@users.length).to_not eq(0)
    end
  end

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
        post :create, { user: @user_attributes }
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
        post :create, { user: @invalid_user_attributes }
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
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
    end

    context 'when user is successfully upddate' do
      before(:each) do
        patch :update, { id: @user.id, user: { email: 'newmail@example.com' } }
      end

      it 'renders the json representation for the user record just created' do
        user_response = json_response
        expect(user_response[:email]).to eql 'newmail@example.com'
      end

      it { should respond_with 201 }
    end

    context 'when is not updated' do
      before(:each) do
        patch :update, { id: @user.id, user: { email: 'bademail.com' } }
      end

      it 'renders an errors json' do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it 'renders the json errors on whye the user could not be created' do
        user_response = json_response
        expect(user_response[:errors][:email]).to include 'is invalid'
      end

      it { should respond_with 422 }
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      delete :destroy, { id: @user.id }
    end

    it { should respond_with 204 }
  end
end
