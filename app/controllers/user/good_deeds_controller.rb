# frozen_string_literal: true

# app/controllers/user/good_deeds_controller.rb
class User::GoodDeedsController < ApplicationController
  def index
    @deeds = GoodDeedFacade.new
  end

  def new
    @facade = UserFacade.new(params)
  end
end
