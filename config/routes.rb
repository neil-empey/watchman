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

  get 'vehicles/new' => 'vehicles#new'
  post 'vehicles' => 'vehicles#create'

  get '/dashboard' => 'sessions#github'

  get '/images/new' => 'images#new'
  post '/images' => 'images#create'

  get "/user/:id/reports" => 'reports#index'




  resources :users do
    resources :reports, only: [:show, :index]
    end

  resources :reports do
    resources :comments, only: [:new]
    end

  resources :neighborhoods do
    resources :users, only: [:index]
    end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
