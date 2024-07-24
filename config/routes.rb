Rails.application.routes.draw do
  root "reviews#index"
  
  devise_for :users

  resources :reviews
  resources :products
  resources :companies
end
