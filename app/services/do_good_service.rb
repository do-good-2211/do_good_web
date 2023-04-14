class DoGoodService

  def self.create_user(oauth_hash)
  
    response = conn.post("/api/v1/users") do |req|
      req.body = {query: oauth_hash}.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.retrieve_oauth_user(uid)
    response = get_conn.get("/api/v1/users/#{uid}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      Faraday.new(url: "http://localhost:3000",
        params: {param: "1"},
        headers: {"Content-Type" => "application/json"}
      )
    end

    def self.get_conn 
      Faraday.new(url: "http://localhost:3000")
    end
end