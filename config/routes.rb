Rails.application.routes.draw do
  get 'products/index'
  get 'products/create'
  get 'products/new'
  get 'products/edit'
  get 'products/show'
  get 'products/update'
  get 'products/destroy'
  devise_for :users
  root 'products#index'
  resources :mypages, only: [:index, :edit, :update]
end
