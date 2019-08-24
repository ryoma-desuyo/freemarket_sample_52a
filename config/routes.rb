Rails.application.routes.draw do
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
