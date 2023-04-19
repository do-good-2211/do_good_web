# frozen_string_literal: true

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :not_authorized, only: [:show]
  def login; end

  def show
    # token, events, email are all nil when testing show_spec ??
    @user_facade = UserFacade.new(params, current_user).fetch_user_dashboard
    token = session[:token]
    @email = current_user.email.gsub("@gmail.com", "")
    @events = CalendarFacade.new.list_events(token)
  end
end
