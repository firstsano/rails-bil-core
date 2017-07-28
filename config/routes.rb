Rails.application.routes.draw do
  scope module: :v1 do
    post '/users/sign-in' => 'user_token#create'
    get '/discounts/index'
    get '/payments/index'
    get '/users/show'
    get '/services/index'
  end
end
