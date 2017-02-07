require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe 'Post #create' do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    context 'when the credentials are correct' do
      before(:each) do
        post :create, session: { email: @user.email, password: '12345678' }
      end

      it 'returns the user record based on credentials' do
        @user.reload
        expect(json_response[:auth_token]).to eq @user.auth_token
      end

      it { should respond_with 200 }
    end

    context 'when the credentials are wrong' do
      before(:each) do
        post :create, session: { email: @user.email, password: 'invalidpassword' }
      end

      it 'returns a json with an error' do
        expect(json_response[:errors]).to eql 'Invalid email or password'
      end

      it { should respond_with 422 }
    end
  end
end
