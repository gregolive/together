Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, :only => [:show]
  resources :posts
  resources :comments
end
