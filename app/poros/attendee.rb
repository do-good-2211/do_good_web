# frozen_string_literal: true

# app/poros/attendee.rb
class Attendee < ApplicationController
  attr_reader :name

  def initialize(info)
    @name = info[:name]
  end
end
