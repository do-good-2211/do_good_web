class GoodDeedsController < ApplicationController
  def index
    @deeds = GoodDeedFacade.new
  end

  def login
    
  end
end