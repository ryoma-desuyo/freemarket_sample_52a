Rails.application.routes.draw do
  get 'products/index'
  get 'products/create'
  get 'products/new'
  get 'products/edit'
  get 'products/show'
  get 'products/update'
  get 'products/destroy'
  get 'product/index'
  get 'product/create'
  get 'product/new'
  get 'product/edit'
  get 'product/show'
  get 'product/update'
  get 'product/destroy'
  devise_for :users
  root 'product#index'
end
