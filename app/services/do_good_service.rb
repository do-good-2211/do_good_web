class DoGoodService

  def self.create_user(oauth_hash)
    require 'pry'; binding.pry
    response = conn.post("/api/v1/users") do |req|
      req.body = oauth_hash.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      Faraday.new(url: "http://localhost:3000")
    end
end