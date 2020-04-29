Rails.application.routes.draw do
  resources :tellers
  resources :companies
  resources :countries
  get 'home/index'
  devise_for :users
  resources :users, only: [:index]
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
