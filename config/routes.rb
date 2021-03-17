Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :search, only: [:index], controller: 'pages'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

resources :bookings, only: [:new, :create, :show]








end
