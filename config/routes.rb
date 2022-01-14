Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  resources :users, only: %i[show index]
  resources :friendships, only: %i[create destroy]
  resources :posts do
    resources :comments, only: %i[new create edit update destroy] do
      resources :likes, only: %i[create destroy]
    end
    resources :likes, only: %i[create destroy]
  end
end
