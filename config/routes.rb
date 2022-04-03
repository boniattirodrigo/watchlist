Rails.application.routes.draw do
  resources :wallet_items
  resources :wallets
  devise_for :users
  resources :alerts
  resources :quotes
  resources :assets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
