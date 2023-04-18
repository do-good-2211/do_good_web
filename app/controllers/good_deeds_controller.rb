# frozen_string_literal: true

# app/controllers/good_deeds_controller.rb
class GoodDeedsController < ApplicationController
  def index
    @deeds = GoodDeedFacade.new(params, nil, nil)
  end
end
