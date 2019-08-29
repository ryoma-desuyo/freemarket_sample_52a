Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  as :user do
    get "sign_up/number" => "users/registrations#number"
  end
end
