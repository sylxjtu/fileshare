Rails.application.routes.draw do
  resources :groups do
    get 'join', on: :member
    get 'drop', on: :member
    get 'new_message', on: :member
    post 'send_message', on: :member
    get 'new_document', on: :member
    post 'upload_document', on: :member
  end
  resources :users do
    get 'new_message', on: :member
    post 'send_message', on: :member
  end
  get 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  post 'login', to: 'users#postlogin'
  resources :messages
  resources :documents
  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
