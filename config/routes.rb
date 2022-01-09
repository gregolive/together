Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]
  resources :posts do
    resources :comments, only: %i[new create edit update destroy] do
      resources :likes, only: %i[create destroy]
    end
    resources :likes, only: %i[create destroy]
  end
end
