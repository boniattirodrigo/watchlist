Rails.application.routes.draw do
  resources :alerts, only: %i[index]
  devise_for :users

  root to: 'wallets#index'

  post '/wallet/items', to: 'wallet_items#create'
  delete '/wallet/items', to: 'wallet_items#destroy'
end
