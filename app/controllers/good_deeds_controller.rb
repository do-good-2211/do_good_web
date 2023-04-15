# frozen_string_literal: true

# app/controllers/good_deeds_controller.rb
class GoodDeedsController < ApplicationController
  def index
    @deeds = GoodDeedFacade.new
  end

  def new
    @good_deed = params[:good_deed]
    return unless current_user.nil?

    redirect_to login_path
    flash[:alert] = "You must be logged in to create a new good deed"
  end

  def login; end
end
