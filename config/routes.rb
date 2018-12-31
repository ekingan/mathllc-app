Rails.application.routes.draw do
  get 'home/index' 
  root 'home#index'
  get '/about', to: 'about#index'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
