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
  resources :products
  resources :mypages, only: [:index, :edit, :update]
end
