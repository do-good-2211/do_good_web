# frozen_string_literal: true

# app/controllers/user/good_deeds_controller.rb
class User::GoodDeedsController < ApplicationController
  def new
    @facade = UserFacade.new(params, current_user)
  end

  def create
    GoodDeedFacade.new(params, current_user[:id]).create_deed
    redirect_to dashboard_path
  end
end
