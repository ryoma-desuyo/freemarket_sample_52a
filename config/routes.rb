Rails.application.routes.draw do
  devise_for :users
  root 'mercari#index'
end
