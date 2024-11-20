Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "users/sign_up", to: "user#sign_up"
  get "users/sign_in", to: "user#sign_in"
  get "users/password/new", to: "user#new_password"
  # Defines the root path route ("/")
  # root "posts#index"

  get 'items', to: 'items#index', as: :items

  get 'search', to: 'items#search', as: :search

  get "items/:id", to: "items#show", as: :item

  get "items/:id/bookings", to: "bookings#new", as: :new_booking
  # create new item
  get "new", to: "items#new", as: :new_item
  post "items", to: "items#create", as: :create_item
end
