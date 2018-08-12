# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # pages/home route displays the home .erb file inside the views/pages folder
  root 'pages#home'
  get '/about', to: 'pages#about'
  resources :articles

  # signup routes
  get '/signup', to: 'users#new'
  resources :users, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :searches
  # categories routes
  resources :categories, except: [:destroy]
end
