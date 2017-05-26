Rails.application.routes.draw do
  resources :users do
    collection do
      post 'sign-in' => 'user_token#create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
