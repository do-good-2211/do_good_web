class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= session[:user_name] if session[:user_name]
  end
end
