Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  get '/search_user', to: 'search#search_user'
  devise_for :users
end
