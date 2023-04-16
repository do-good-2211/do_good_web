# frozen_string_literal: true

# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def omniauth
    user = SessionsFacade.new.authorize_user(request.env["omniauth.auth"])
    session[:user] = user

    return unless current_user

    redirect_to "/dashboard"
  end
end
