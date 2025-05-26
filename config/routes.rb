Rails.application.routes.draw do
  # Devise user authentication
  devise_for :users

  # Root page
  root to: "main#homepage"

  # Tickets routes
  resources :tickets, only: [:index, :show, :new, :create, :edit, :update] do
  member do
      post :purchase
    end
  end

  # Events routes
  resources :events, only: [:index, :new, :create, :show]

  # User-specific routes
  resources :users, only: [] do
    member do
      get :listings
      get :purchases
    end
  end

  get "users/:id/profile", to: "users#profile", as: "profile_user"

end
