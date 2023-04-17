# frozen_string_literal: true

# app/poros/deed.rb
require './app/poros/attendee.rb'

class Deed
  attr_reader :id,
              :name,
              :date,
              :time,
              :status,
              :notes,
              :media_link
              # :attendees

  def initialize(info)
    @id = info[:id].to_i
    @name = info[:attributes][:name]
    @date = info[:attributes][:date]
    @time = info[:attributes][:time].to_datetime.strftime("%l:%M %p").strip
    @status = info[:attributes][:status]
    @notes = info[:attributes][:notes]
    @media_link = info[:attributes][:media_link]
    # @attendees = info[:attributes][:attendees].map { |attendee| Attendee.new(attendee) }
  end
end
