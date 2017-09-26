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

    namespace :tariffs do
      get :index
      get :available
    end

    namespace :services do
      get :index
    end
  end
end
