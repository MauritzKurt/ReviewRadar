Rails.application.routes.draw do
  root 'homepage#home'
  
  devise_for :users
  get ':username/reviews' => 'reviews#index', as: :current_user_reviews
  
  resources :reviews
  resources :products
  resources :companies
end
