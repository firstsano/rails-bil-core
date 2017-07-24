Rails.application.routes.draw do
  scope module: :v1 do
    post '/users/sign-in' => 'user_token#create'
    get '/discounts/index'
    get '/users/show'
  end
end
