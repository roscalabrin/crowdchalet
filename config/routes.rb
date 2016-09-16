Rails.application.routes.draw do
  root to: 'home#index'
  
  namespace :api do
    namespace :v1 do
      resources  :user_listings, only: [:create]
      # delete 'user_listings',    to: 'user_listings#destroy'
    end
  end
  
  resources :search,           only: [:index]
  resources :searching_groups, only: [:index, :new, :create, :show]
  
  resources :users, only: [:show]
  
  get '/auth/facebook',          as: :facebook_login
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/failure',           to: redirect('/') 
  delete 'logout',               to: 'sessions#destroy'
end
