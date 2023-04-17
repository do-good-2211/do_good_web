# frozen_string_literal: true

# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def omniauth
    user = SessionsFacade.new.authorize_user(request.env["omniauth.auth"])
    session[:user] = user
    session[:token] = request.env["omniauth.auth"][:credentials][:token]
    require 'pry'; binding.pry
    if current_user
      redirect_to "/dashboard"
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_path
    flash[:message] = "Successfully logged out"
  end
end
