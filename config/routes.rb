Rails.application.routes.draw do
  devise_for :users
  get 'events/new'
  get 'events/create'
  get 'tickets/index'

  resources :tickets, only: [:index, :new, :create]
  resources :tickets, only: [:index, :new, :create]
  resources :events, only: [:new, :create]

  root to: "tickets#index"
  
end
