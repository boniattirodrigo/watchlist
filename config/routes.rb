Rails.application.routes.draw do
  devise_for :users

  root to: 'wallets#index'

  post '/wallet/items', to: 'wallet_items#create'
  delete '/wallet/items', to: 'wallet_items#destroy'
  get '/alerts', to: 'alerts#index'
end
