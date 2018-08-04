# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # pages/home route displays the home .erb file inside the views/pages folder
  get '/pages/home',  to: 'pages#home'
  get '/pages/about', to: 'pages#about'
end
