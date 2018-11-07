Rails.application.routes.draw do
  root 'posts#index'
  
  resources :users
  resources :avatars
  resources :posts
  resources :comments
end
