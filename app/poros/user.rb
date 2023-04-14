class User
  attr_reader :name,
              :email,
              :password_digest,
              :role,
              :id

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @role = info[:attributes][:role]
  end
end
