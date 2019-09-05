Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  as :user do
    get "/sign_up/basic_info", to: "users/registrations#basic_info"
    post "sign_up/number", to:"users/registrations#number"
    post "sign_up/address", to: "users/registrations#address"
    get "sign_up/credit", to: "users/registrations#credit"
    post "/sign_up/completed" to:"users/registrations#create"
    get "/sign_up/done", to:"users/registrations#done"
  end
  
  root 'products#index'
  resources :mypages, only: [:index, :edit, :update] do
    member do
      get 'identification'
    end
  end
  resources :products
  resources :mypages, only: [:index, :edit, :update]
  get 'users/new'
end
