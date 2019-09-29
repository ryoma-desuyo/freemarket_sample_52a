Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  },
  skip: %i[sessions]
  as :user do
    get "/sign_up/basic_info", to: "users/registrations#basic_info"
    post "sign_up/number", to:"users/registrations#number"
    post "sign_up/address", to: "users/registrations#address"
    get "sign_up/credit", to: "users/registrations#credit"
    post "/sign_up/completed", to:"users/registrations#create"
    get "/sign_up/done", to:"users/registrations#done"
    get 'login', to:'users/sessions#new', as: :new_user_session
    post 'login', to:'users/sessions#create', as: :user_session
    get '/users/logout', to: "users#logout"
    delete 'logout', to:'users/sessions#destroy', as: :destroy_user_session
  end
  
  resources :users do
    collection do
      get 'logout'
      get 'credits'
    end
  end

  root 'products#index'

  resources :mypages, only: [:index, :edit, :update] do
    member do
      get 'identification'
    end

    collection do
      get 'card'
      get 'products-list'
    end
  end
  
  resources :products, only: [:index, :create, :new, :edit, :update, :show, :destroy] do
    member do
      get 'buying'
      get 'exhibit'
      get 'comfirm'
      post 'buying'
    end

    collection do
      get 'sell'
      get 'details'
    end
  end
  
  resources :mypages, only: [:index, :edit, :update]
  get 'users/new'

  resources :cards, only: [:new, :create]
end