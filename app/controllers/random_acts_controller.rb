class RandomActsController < ApplicationController
  def index
    @acts = RandomActFacade.new
  end
end
