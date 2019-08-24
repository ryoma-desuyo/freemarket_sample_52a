Rails.application.routes.draw do
  devise_for :users
  root 'mercari#index'
  resources :mypages, only: [:index, :edit, :update]
end
