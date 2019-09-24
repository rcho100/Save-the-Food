Rails.application.routes.draw do
  root "sessions#welcome"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'

  resources :reviews
  resources :ingredients
  resources :recipes
  resources :users, only: [:create, :edit, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
