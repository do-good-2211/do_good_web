# frozen_string_literal: true

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :not_authorized, only: [:show]
  def login; end

  def show
    token = session[:token]
    @email = current_user["email"].gsub("@gmail.com", "")
    @events = CalendarFacade.new.list_events(token)
  end
end