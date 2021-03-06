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
  get '/covid-19', to: 'home#covid_19'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
