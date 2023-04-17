# frozen_string_literal: true

# app/controllers/user/good_deeds_controller.rb
class User::GoodDeedsController < ApplicationController
  before_action :not_authorized

  def new
    @facade = UserFacade.new(params, current_user)
  end

  def create
    if params[:date].present? && params[:time].present?
      # This line will pass the test from: spec/features/users/good_deeds/new_spec.rb
      # GoodDeedFacade.new(params, current_user[:id]).create_deed
      # This line will pass when we run rails s
      GoodDeedFacade.new(params, current_user["id"]).create_deed
      redirect_to dashboard_path
    else
      redirect_to new_user_good_deed_path
      flash[:notice] = "Please fill in all parts."
    end
  end
end
