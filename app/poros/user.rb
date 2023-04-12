class User
  attr_reader :name,
              :email,
              :password_digest,
              :role

  def initialize(info)
    @name = info[:name]
    @email = info[:email]
    @password_digest = info[:password_digest]
    @role = info[:role]
  end
end
