# frozen_string_literal: true

# app/poros/deed.rb
class Deed
  attr_reader :id, 
              :name,
              :host_id,
              :date,
              :time,
              :status,
              :media_link,
              :notes,
              :attendees

  def initialize(info)
    @id = info[:id].to_i
    @name = info[:attributes][:name]
    @host_id = info[:attributes][:host_id]
    @date = info[:attributes][:date]
    @time = info[:attributes][:time]
    @status = info[:attributes][:status]
    @media_link = info[:attributes][:media_link]
    @notes = info[:attributes][:notes]
    @attendees = info[:attributes][:attendees]
  end
end
