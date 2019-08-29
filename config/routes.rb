Rails.application.routes.draw do
  get 'users/new'

  devise_for :users
  resources :mypages, only: [:index, :edit, :update]
  resources :products
  root 'products#index'
end
