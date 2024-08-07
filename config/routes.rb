Rails.application.routes.draw do
  root 'homepage#home'
  get 'search', to: 'homepage#index', as: 'search'
  
  devise_for :users
  get ':username/reviews' => 'reviews#index', as: :current_user_reviews

  # get ':products' => 'products#index', as: :products_index
  # get ':companies' => 'companies#index', as: :companies_index
  
  resources :reviews do
    collection do
      get :get_items
    end
  end
  
  resources :products
  resources :companies
end
