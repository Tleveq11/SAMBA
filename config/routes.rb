Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'pages#home'

  resources :bookings, only: [:new, :create, :show]
  get '/results', to: 'bookings#search'
  get '/activities', to: 'bookings#activities'
  get '/results_activities', to: 'bookings#search_activities'
  get '/roadbook', to: 'bookings#roadbook'
  get '/roadbook_confirmed', to: 'bookings#roadbook_confirmed'

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

end
