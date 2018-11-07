Rails.application.routes.draw do
  resources :users
  resources :avatars
  resources :posts
  resources :comments
end
