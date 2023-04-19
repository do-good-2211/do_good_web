# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return if session[:user].nil?

    info = { id: session[:user]["id"], attributes: { name: session[:user]["name"], email: session[:user]["email"] } }
    @current_user ||= User.new(info)
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
