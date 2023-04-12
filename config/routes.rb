Rails.application.routes.draw do

get "/", to: "good_deeds#index"

get "/login", to: "good_deeds#login"

get "/random_acts", to: "random_acts#index"
end
