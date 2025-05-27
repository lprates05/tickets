Rails.application.routes.draw do
  # Devise user authentication
  devise_for :users, sign_out_via: [:get, :delete]


  # Root page
  root to: "main#homepage"

  # Tickets routes
  resources :tickets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  member do
      post :purchase
    end
  end

  # Events routes
  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # User-specific routes
  resources :users, only: [] do
    member do
      get :listings
      get :purchases
    end
  end

  get "users/:id/profile", to: "users#profile", as: "profile_user"

end
