Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#profile'
  root to: 'wishes#index'


  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  resources :users do
    resources :wishes
  end

  match '/signup',    to: 'users#new',    via: 'get'

end
