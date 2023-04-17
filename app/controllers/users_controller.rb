# frozen_string_literal: true

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :not_authorized, only: [:show]
  def login; end

  def show
    @facade = UserFacade.new(params, current_user).fetch_user_dashboard
  end
end
