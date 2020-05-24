Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books,only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :books do
    resources :comments, only: [:create, :destroy]
  end
end