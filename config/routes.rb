Rails.application.routes.draw do
  root 'user/good_deeds#index'

  get "/login", to: "users#login"
  get "/auth/:provider/callback", to: "sessions#omniauth"

  namespace :user do
    resources :good_deeds, only: [:new]
  end

  resources :random_acts, only: [:index]
end
