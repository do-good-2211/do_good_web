Rails.application.routes.draw do
  root 'good_deeds#index'

  get "/about", to: "pages#about"

  get "/login", to: "users#login"
  get "/logout", to: "sessions#logout"
  get "/auth/:provider/callback", to: "sessions#omniauth"
  get "/dashboard", to: "users#show"

  namespace :user do
    resources :good_deeds, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :random_acts, only: [:index]
end
