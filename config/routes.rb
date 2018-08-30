# frozen_string_sanatizer: true
Rails.application.routes.draw do
  root to: 'home#index'
  resources :subscriptions, only: [:create]
  resource  :contact, only: [:create]
end
