class GoodDeedsController < ApplicationController
  def index
    @deeds = GoodDeedFacade.new(params, nil)
  end
end