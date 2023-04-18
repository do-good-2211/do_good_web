# frozen_string_literal: true

# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def omniauth
    user = SessionsFacade.new.authorize_user(request.env["omniauth.auth"])
    session[:token] = request.env["omniauth.auth"][:credentials][:token]
    session[:user] = user
    return unless current_user

    redirect_to "/dashboard"
  end

  def logout
    session[:user] = nil
    session[:token] = nil
    redirect_to root_path
    flash[:message] = "Successfully logged out"
  end
end
