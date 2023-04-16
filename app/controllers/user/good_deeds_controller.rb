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

  private
  def good_deed_params
    params.permit(:name, :date, :time, :attendees)
  end
end
