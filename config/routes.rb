Rails.application.routes.draw do

  devise_for :users
  resources :users, only: %i[show index] do
    member do
      get :following, :followers
    end
  end
  root 'pages#index'
  resources :images do
    resources :likes
  end
  resources :relationships, only: %i[create destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
