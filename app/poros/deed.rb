# frozen_string_literal: true

# app/poros/deed.rb
require './app/poros/attendee'

class Deed
  attr_reader :id,
              :name,
              :date,
              :time,
              :status,
              :notes,
              :media_link,
              :attendees

  def initialize(info)
    @id = info[:id].to_i
    @name = info[:attributes][:name]
    @date = info[:attributes][:date]
    @time = info[:attributes][:time].to_datetime.strftime("%l:%M %p").strip
    @status = info[:attributes][:status]
    @notes = info[:attributes][:notes]
    @media_link = info[:attributes][:media_link]
    @attendees = make_attendees(info[:attributes][:attendees])
  end

  def make_attendees(data)
    data.map { |attendee| Attendee.new(attendee) } unless data.nil?
  end
end
