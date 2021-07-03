Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy, :update, :edit]
  resources :users, only: [:show, :index, :edit, :update]
  root "homes#top"
  get "home/" => "homes#top"
  get "home/about" => "homes#about"
  get "user/edit" => "user#edit"
end
