class GoodDeedsController < ApplicationController
  def index
    @deeds = GoodDeedFacade.new(params, nil)
  end

  def create
     # Need to pass the users token (session[:token]), email (from params or from finding a user object) and create params. If created successfully, add it to the calendar.
  end
end