Rails.application.routes.draw do
  scope module: :v1 do
    post '/users/sign-in' => 'user_token#create'

    namespace :discounts do
      get :index
    end

    namespace :payments do
      get :index
    end

    namespace :users do
      get :show
    end

    resources :tariffs, only: [:index, :create, :destroy, :update] do
      collection do
        get :available
      end
    end

    namespace :services do
      get :index
    end

    namespace :promised_payments, path: 'promised-payments' do
      get :show
      put :use
    end
  end
end
