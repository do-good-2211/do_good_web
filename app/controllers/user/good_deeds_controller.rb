# frozen_string_literal: true

# app/controllers/user/good_deeds_controller.rb
class User::GoodDeedsController < ApplicationController
  before_action :not_authorized

  def new
    @facade = UserFacade.new(params, current_user)
  end

  def create
    email = current_user.email
    if params[:date].present? && params[:time].present?
      GoodDeedFacade.new(params, current_user.name, current_user.id).create_deed
      CalendarFacade.new.create_event(email, params, session[:token])
      redirect_to dashboard_path
    else
      redirect_to new_user_good_deed_path
      flash[:notice] = "Please fill in all parts."
    end
  end

  def edit
    @facade = GoodDeedFacade.new(params, nil, current_user.id)
  end

  def update
    GoodDeedFacade.new(params, nil, current_user.id).update_deed
    redirect_to dashboard_path
  end

  def destroy
    GoodDeedFacade.new(params, nil, current_user.id).delete_deed
    redirect_to dashboard_path
  end
end
