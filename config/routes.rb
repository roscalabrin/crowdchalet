Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
    post 'user_listings', to: 'user_listings#create'  
    end
  end
  
  resources :search,          only: [:index]
  resources :searching_groups, only: [:idex, :new, :create, :show]
  
  get '/auth/facebook',          as: :facebook_login
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/failure',           to: redirect('/') 
  delete 'logout',               to: 'sessions#destroy'

end
