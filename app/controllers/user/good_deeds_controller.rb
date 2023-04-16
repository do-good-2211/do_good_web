# frozen_string_literal: true

# app/controllers/user/good_deeds_controller.rb
class User::GoodDeedsController < ApplicationController
  def new
    @facade = UserFacade.new(params, current_user)
  end

  def create
    if params[:date].present? && params[:time].present?
      GoodDeedFacade.new(params, current_user[:id]).create_deed
      redirect_to dashboard_path
    else
      redirect_to new_user_good_deed_path
      flash[:notice] = "Please fill in all parts."
    end
  end

  def edit
    @facade = GoodDeedFacade.new(params, current_user[:id])
  end

  def update
  end
end
