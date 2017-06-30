Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users/sign-in' => 'user_token#create'
      get '/account/discounts'
    end
  end
end
