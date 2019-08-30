Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  as :user do
    get "sign_up/number" => "users/registrations#number"
    get "sign_up/address" => "users/registrations#address"
  end
end
