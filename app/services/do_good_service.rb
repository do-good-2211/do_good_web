# frozen_string_literal: true

# app/services/do_good_service.rb
class DoGoodService
  def self.create_user(oauth_hash)
    response = conn.post("/api/v1/users") do |req|
      req.body = { query: oauth_hash }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_deed(id, deed_hash)
    response = conn.post("/api/v1/users/#{id}/good_deeds") do |req|
      req.body = deed_hash.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_deed(user_id, deed_id, deed_hash)
    response = conn.patch("/api/v1/users/#{user_id}/good_deeds/#{deed_id}") do |req|
      req.body = deed_hash.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://warm-temple-59633.herokuapp.com/",
                params: { param: "1" },
                headers: { "Content-Type" => "application/json" })
  #   Faraday.new(url: "http://localhost:3000",
  #               params: { param: "1" },
  #               headers: { "Content-Type" => "application/json" })
   end
end
