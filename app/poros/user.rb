class User
  attr_reader :name,
              :email,
              :password_digest,
              :role,
              :id

  def initialize(info)
    # require 'pry'; binding.pry
    @id = info[:id]
    @name = info[:attributes][:name]
    # @email = info[:email]
    # @password_digest = info[:password_digest]
    @role = info[:attributes][:role]
  end
end
