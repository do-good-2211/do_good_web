# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= session[:user] if session[:user]
  end

  def current_user?
    current_user && !current_user.nil?
  end

  private

  def not_authorized
    return if current_user?

    redirect_to root_path
    flash[:alert] = "You are not authorized to access this page"
  end
end
