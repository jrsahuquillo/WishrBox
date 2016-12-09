Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#profile'
  root to: 'users#feed'


  get '/feed', to: 'wishes#index'
  get '/search_following', to: 'users#search_following'
  get '/', to: 'users#show'
    # post '/follow_to', to: 'users#follow_to', as: 'follow'
    # match '/follow_to',    to: 'users#follow_to', as: 'follow',   via: 'get'

  # get '/users/:id', to: 'users#show'
  resources :users do
    post '/follow/:id', to: 'users#follow_to', as: :follow
    post '/no_follow/:id', to: 'users#nofollow_to', as: :nofollow
    resources :followings
      resources :wishes
  end

  resources :wishes, only: :show

  match '/signup',    to: 'users#new',    via: 'get'

end
