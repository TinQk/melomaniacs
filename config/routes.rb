Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :artists, only: [:show] do
  	resources :likes, only: [:create, :destroy]
  end
  resources :genres, only: [:show]
  resources :home, only: [:index]
  get '/discover', to: 'home#discover'
end
