# frozen_string_literal: true

# app/poros/deed.rb
require './app/poros/attendee'

class Deed
  attr_reader :id,
              :name,
              :host_id,
              :host_name,
              :date,
              :time,
              :status,
              :media_link,
              :notes,
              :attendees

  def initialize(info)
    @id = id_to_integer(info[:id])
    @name = info[:attributes][:name]
    @host_id = info[:attributes][:host_id]
    @host_name = info[:attributes][:host_name]
    @date = info[:attributes][:date]
    @time = info[:attributes][:time].to_datetime.strftime("%l:%M %p").strip
    @status = info[:attributes][:status]
    @media_link = info[:attributes][:media_link]
    @notes = info[:attributes][:notes]
    @attendees = make_attendees(info[:attributes][:attendees])
  end

  def make_attendees(data)
    data.map { |attendee| Attendee.new(attendee) } unless data.nil?
  end

  def id_to_integer(id)
    id.to_i unless id.instance_of?(Integer)
  end
end
