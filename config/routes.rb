Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "guests", to: "guests#index"
  get "guests/:id", to: "guests#show"
  get "guests/new", to: "guests#new"
  post "guests", to: "guests#create"

  get "rooms", to: "rooms#index"
end
