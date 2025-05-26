Rails.application.routes.draw do
  # Devise user authentication
  devise_for :users

  # Root page
  root to: "tickets#index"

  # Tickets routes
  resources :tickets, only: [:index, :new, :create, :show]

  # Events routes
  resources :events, only: [:index, :new, :create, :show]

  # User-specific routes (like My Listings and My Purchases)
  resources :users, only: [] do
    member do
      get :listings
      get :purchases
    end
  end
end
