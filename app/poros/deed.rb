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