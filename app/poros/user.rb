class User
  attr_reader :id,
              :name

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
  end
end
