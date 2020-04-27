Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    collection do
      get :latest
    end
  end

  resources :posts do 
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
