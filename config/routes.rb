Rails.application.routes.draw do
  get 'mypages/index'
  get 'mypages/edit'
  get 'mypages/update'
  devise_for :users
  root 'mercari#index'
end
