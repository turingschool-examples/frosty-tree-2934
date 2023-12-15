Rails.application.routes.draw do
  get 'guests/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/guests', to: 'guests#index'
  get '/guests/:id', to: 'guests#show'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
