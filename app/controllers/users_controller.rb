# frozen_string_literal: true

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :not_authorized, only: [:show]
  def login; end

  def show; end
end
