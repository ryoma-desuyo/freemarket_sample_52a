Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  as :user do
    get "sign_up/number", to:"users/registrations#number"
    get "sign_up/address", to: "users/registrations#address"
    get "sign_up/credit", to: "users/registrations#credit"
    get "/sign_up/done", to:"users/registrations#done"
  end
  get 'products/index'
  get 'products/create'
  get 'products/new'
  get 'products/edit'
  get 'products/show'
  get 'products/update'
  get 'products/destroy'
  root 'products#index'
  resources :mypages, only: [:index, :edit, :update]
end
