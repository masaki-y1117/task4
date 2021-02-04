Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  post 'follow/:id' => 'relationships#create', as:'follow'
  delete 'unfollow/:id' => 'relationships#destroy',as:'unfollow'
  get 'home/about' => 'homes#about'
  
  get 'relationship/follow_index/:user_id' => 'relationships#follow_index', as: 'relationship_follow_index'
  get 'relationship/follower_index/:user_id' => 'relationships#follower_index', as: 'relationship_follower_index'
end
