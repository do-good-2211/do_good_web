# frozen_string_literal: true

# app/controllers/random_acts_controller.rb
class RandomActsController < ApplicationController
  def index
    @acts = RandomActFacade.new
  end
end
