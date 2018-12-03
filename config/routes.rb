Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'artists/show'
  root 'home#index'
  devise_for :users
  resources :artists, only: [:show]
  resources :likes, only: [:create, :destroy]
  resources :home, only: [:index]
end
