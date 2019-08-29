Rails.application.routes.draw do
  resources :products
  devise_for :users
  resources :mypages, only: [:index, :edit, :update]
  root 'products#index'
end
