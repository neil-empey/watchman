Rails.application.routes.draw do


  resources :neighborhood_report_locations
  root 'sessions#welcome'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  post '/logout' => 'sessions#destroy'

  get '/users/:id' => 'users#show'

  get '/auth/:provider/callback', to: 'sessions#google_auth'

  get '/vehicles' => 'vehicles#show'
  get '/vehicles/new' => 'vehicles#new'
  post 'vehicles' => 'vehicles#create'

  get '/images' => 'images#show'
  get '/images/new' => 'images#new'
  post '/images' => 'images#create'
  get '/images/:id/edit' => 'images#edit'
  patch '/images/:id' => 'images#update'

  get "/user/:id/reports" => 'reports#index'

  get "/reports/:id/comments/new" => 'comments#new'
  post "/reports/:id/comments" => 'comments#create'

  get "/neighborhoods/:id/users" => 'neighborhoods#show'

  get '/users/:user_id/comments' => 'comments#index'

  get '/bulletin/:user_id/new' => 'neighborhood_bulletin#new'

  resources :reports

  resources :users do
    resources :reports, only: [:show, :index]
    end

  resources :neighborhoods do
    resources :reports, only: [:index]
    end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
