Rails.application.routes.draw do
  root to: 'home#index'
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        resources :likes,          only: [:create]
        delete 'likes', to: 'likes#destroy'
    end
  end

  resources :group_listings, only: [:create]
  delete 'group_listings', to: 'group_listings#destroy'
  resources :user_listings,  only: [:create]
  delete 'user_listings',    to: 'user_listings#destroy'
  
  resources :search,           only: [:index]
  resources :searching_groups, only: [:index, :new, :create, :show]
  
  resources :users, only: [:show]
  
  get '/auth/facebook',          as: :facebook_login
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/failure',           to: redirect('/') 
  delete 'logout',               to: 'sessions#destroy'
end
