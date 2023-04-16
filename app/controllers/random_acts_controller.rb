# frozen_string_literal: true

# app/controllers/random_acts_controller.rb
class RandomActsController < ApplicationController
  before_action :not_authorized
  def index
    @acts = RandomActFacade.new
  end
end
