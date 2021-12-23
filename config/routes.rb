Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'posts#index'
  delete 'posts/:id' => 'posts#destroy', :as => :destroy_post
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
end
