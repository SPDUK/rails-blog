# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # welcome/home route displays the home .erb file inside the welcome folder
  get '/welcome/home',  to: 'welcome#home'
  get '/welcome/about', to: 'welcome#about'
end
