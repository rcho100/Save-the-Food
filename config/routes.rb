Rails.application.routes.draw do
  root "sessions#welcome"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get 'recipes/under_thirty', to: 'recipes#under_thirty'
  
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :ingredients
  resources :recipes do
    resources :reviews
  end
  resources :users, only: [:create, :edit, :show, :update] do
    resources :reviews
  end
  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
