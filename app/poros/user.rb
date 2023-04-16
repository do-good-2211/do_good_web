# frozen_string_literal: true

# app/poros/user.rb
class User
  attr_reader :name,
              :role,
              :id

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @role = info[:attributes][:role]
  end
end
