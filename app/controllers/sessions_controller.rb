# frozen_string_literal: true

# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def omniauth
    user = SessionsFacade.new.authorize_user(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:message] = "Welcome, #{user.name}!"

    redirect_to "/login"
  end
end
