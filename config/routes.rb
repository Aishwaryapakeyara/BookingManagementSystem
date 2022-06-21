Rails.application.routes.draw do
  root "mains#index"
  resources :users do
    resources :bookings do
      put "confirm"
      put "cancel"
    end
  end

  resources :categories
  resources :events
  resources :roles
  resources :cities
  resources :locations
  resources :notifications
  get "/bookings", to: "bookings#index", as: "bookings"
  get "/bookings/show", to: "bookings#show", as: "bookings_show"
  get "/events/populate_location", to: "events#populate_location"
end
