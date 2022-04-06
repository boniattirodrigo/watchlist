require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  root to: 'wallets#index'

  post '/wallet/items', to: 'wallet_items#create'
  delete '/wallet/items', to: 'wallet_items#destroy'
  get '/alerts', to: 'alerts#index'
end
