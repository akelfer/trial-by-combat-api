Rails.application.routes.draw do
  root 'posts#index'
  
  resources :users
  resources :avatars
  resources :posts
  resources :comments
  resources :votes

  resources :challenges, only: [:index, :create, :update, :destroy]
  resources :messages, only: [:create]
  
  post '/posts/:avatar_id', to: 'posts#index_by_avatar'
  get '/enemies', to: 'avatars#enemies_by_avatar'

  mount ActionCable.server => '/cable'
end