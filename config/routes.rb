Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resources :relationships, only: [:create, :destroy]
  get 'home/about' => 'homes#about'
end