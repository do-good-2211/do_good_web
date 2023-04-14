# frozen_string_literal: true

# app/poros/deed.rb
class Deed
  attr_reader :name,
              :media_link,
              :id

  def initialize(info)
    @id = info[:id].to_i
    @name = info[:attributes][:deed_name]
    @media_link = info[:attributes][:media_link]
  end
end
