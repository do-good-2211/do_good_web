# frozen_string_literal: true

# app/services/do_good_service.rb
class DoGoodService
  def self.create_user(oauth_hash)
    response = conn.post("/api/v1/users") do |req|
      req.body = { query: oauth_hash }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://localhost:3000",
                params: { param: "1" },
                headers: { "Content-Type" => "application/json" })
  end
end
