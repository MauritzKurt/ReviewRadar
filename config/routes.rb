Rails.application.routes.draw do
  root 'homepage#home'

  devise_for :users

  resources :reviews
  resources :products
  resources :companies
end
