Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"

  # users
  get "users/:id/dashboard", to: "users#dashboard", as: :dashboard

  # bookings
  get "items/:id/bookings/new", to: "bookings#new", as: :new_booking
  post "items/:id/bookings", to: "bookings#create", as: :bookings
  resources :bookings, only: [:destroy]

  # items
  get 'search', to: 'items#search', as: :search
  resources :items, only: [:index, :show, :new, :create]

end
