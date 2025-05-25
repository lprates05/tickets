Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'tickets/index'

  resources :tickets, only: [:index, :new, :create]
  
end
