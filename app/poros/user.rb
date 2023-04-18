# frozen_string_literal: true

# app/poros/user.rb
class User
  attr_reader :name,
              :role,
              :id,
              :email

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @role = info[:attributes][:role]
    @email = info[:attributes][:email]
  end
end
