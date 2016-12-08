Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#profile'
  root to: 'wishes#index'


  get '/feed', to: 'wishes#index'

  # get '/users/:id', to: 'users#show'
  resources :users do
      resources :wishes
  end

  resources :wishes, only: :show

  match '/signup',    to: 'users#new',    via: 'get'

end
