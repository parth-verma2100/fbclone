Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  devise_for :users
  get '/addfriend/users/:id', to: 'posts#addfriend', as: 'addfriend'
  get '/accept/users/:id', to: 'posts#accept', as: 'accept'
end
