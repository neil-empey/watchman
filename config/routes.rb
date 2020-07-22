Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  post '/logout' => 'sessions#destroy'

  get 'users/:id' => 'users#show'

  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'

  get '/dashboard' => 'sessions#github'
  get '/vehicles', to: 'vehicles#show'
  get '/reports/:id', to: 'reports#index'

  resources :users do
    resources :reports, only: [:new, :create, :index]
    end

  resources :reports do
    resources :comments, only: [:new, :create, :index]
    end

  resources :neighborhoods
  resources :reports
  resources :images, only: [:new, :create, :show]
  resources :vehicles, only: [:new, :create, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
