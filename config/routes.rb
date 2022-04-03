Rails.application.routes.draw do
  resources :alerts, only: %i[index]
  devise_for :users

  root to: 'wallets#index'
end
