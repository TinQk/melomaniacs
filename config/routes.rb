Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :artists, only: [:show]
  resources :genres, only: [:show]
  resources :likes, only: [:create, :destroy]
  resources :home, only: [:index]
  resources :artists do
  resources :likes
  end
end
