# frozen_string_literal: true

# app/poros/user.rb
class User
  attr_reader :name,
              :role,
              :id, 
              :good_deeds

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @role = info[:attributes][:role]
    @good_deeds = info[:attributes][:good_deeds][:data]
  end

end
