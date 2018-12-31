Rails.application.routes.draw do
  get 'services/index'
  get 'home/index' 
  root 'home#index'
  get '/about', to: 'about#index'
  get '/services', to: 'services#index'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
