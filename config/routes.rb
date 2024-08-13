Rails.application.routes.draw do
  root 'homepage#home'
  get 'search', to: 'homepage#index', as: 'search'
  
  devise_for :users
  get ':username/reviews' => 'reviews#index', as: :current_user_reviews

  resources :reviews do
    collection do
      get :get_items
    end
  end
  
  resources :products do
    resources :reviews, only: [:create]
  end
  
  resources :companies do
    resources :reviews, only: [:create]
  end
end
