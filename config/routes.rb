Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/hotels/:id", to: "hotels#show"

  get "/rooms", to: "rooms#index"

  get "/guests/:id", to: "guests#show"
  post "/guests/:id/rooms", to: "guest_rooms#create"
end
