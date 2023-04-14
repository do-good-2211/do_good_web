Rails.application.routes.draw do
  get "/", to: "good_deeds#index"

  get "/login", to: "good_deeds#login"

  get "/random_acts", to: "random_acts#index"

  get "/user/good_deeds/new", to: "good_deeds#new"

  get "/auth/:provider/callback", to: "sessions#omniauth"
end
