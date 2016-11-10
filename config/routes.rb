Rails.application.routes.draw do
  resources :groups do
    get 'join', on: :member
    get 'drop', on: :member
  end
  resources :users
  get 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  post 'login', to: 'users#postlogin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
