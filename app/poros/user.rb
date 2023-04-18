# frozen_string_literal: true

# app/poros/user.rb
# require './app/poros/deed'
class User
  attr_reader :name,
              :role,
              :id, 
              :good_deeds

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @role = info[:attributes][:role]
    @good_deeds = info[:attributes][:good_deeds] #[:data]
    # @good_deeds = make_deeds(info[:attributes][:good_deeds]) unless !info[:attributes][:good_deeds].present?
  end

  # def make_deeds(data)
  #   data.map { |deed| Deed.new(deed) } unless data.nil?  
  # end

end
