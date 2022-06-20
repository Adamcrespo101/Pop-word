Rails.application.routes.draw do
  
  resources :words
  resources :life_time_scores
  resources :users

  post '/login', to: "sessions#create"

  delete '/logout', to: "sessions#destroy"

  get '/me', to: 'users#show'

  get '/find/:id', to: 'users#find'

  get '/signup', to: "users#create"

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
