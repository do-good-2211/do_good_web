# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= session[:user] if session[:user]
  end
end
