require 'api_constraints'

RichHoneyApi::Application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      # destroy should be changed to archived. In the mean time, have it as destroy
      resources :sessions, only: [:create, :destroy]
      resources :products, only: [:index, :show, :create]
    end
  end
end
