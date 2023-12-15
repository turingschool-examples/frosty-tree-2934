Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/guests/:id", to: "guests#show", as: :show_guest
  patch "/guests/:id", to: "guests#update", as: :patch_suite
  get "/rooms/:id", to: "rooms#index", as: :index_rooms
end
