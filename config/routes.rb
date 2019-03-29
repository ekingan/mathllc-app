Rails.application.routes.draw do
  get 'services/index'
  get 'home/index' 
  root 'home#index'
  get '/about', to: 'home#about'
  get '/services', to: 'home#services'
  get '/new-clients', to: 'home#new_clients'
  get '/returning-clients', to: 'home#returning_clients'
  get '/dates', to: 'home#dates'
  get '/resources', to: 'home#resources'

  authenticate :user do
    scope 'admin/' do
      get '/todos', to: 'todos#index'
      post '/todos', to: 'todos#create'
      put '/todos/sort/:id', to: 'todos#sort'
      put '/todos/:id', to: 'todos#update'
      delete '/todos/:id', to: 'todos#destroy'
    end
  end
  
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
