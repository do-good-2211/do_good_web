# frozen_string_literal: true

# app/poros/user.rb
# require './app/poros/deed'
class User
  attr_reader :name,
              :role,
              :id, 
              :good_deeds,
              :email

  def initialize(info)
    @id = info[:id]
    # @id = id_to_integer(info[:id])
    @name = info[:attributes][:name]
    @role = info[:attributes][:role]
    @good_deeds = info[:attributes][:good_deeds] 
    @email = info[:attributes][:email]
  end

  # def id_to_integer(id)
  #   x = id.to_i unless id.class == Integer
  # end

end
