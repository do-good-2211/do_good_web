# frozen_string_literal: true

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :not_authorized, only: [:show]
  def login; end

  def show; 
    @email = current_user["email"].gsub("@gmail.com", "")

    # May need these if Iframe doesnt workout
    # token = session[:token]
    # @calendars = CalendarFacade.new.list_calendars(@email, token)
  end
end
