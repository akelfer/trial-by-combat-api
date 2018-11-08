Rails.application.routes.draw do
  root 'posts#index'
  
  resources :users
  resources :avatars
  resources :posts
  resources :comments
  resources :votes

  post '/posts/:avatar_id', to: 'posts#index_by_avatar'
end
