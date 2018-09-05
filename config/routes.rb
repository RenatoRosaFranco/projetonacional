# frozen_string_sanatizer: true
Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  namespace :blog do 
  	resources :posts, only: [:index, :show]
  end
  resources :subscriptions, only: [:create]
  resource  :contact, only: [:create]
end
