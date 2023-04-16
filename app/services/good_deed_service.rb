# frozen_string_literal: true

# app/services/good_deed_service.rb
class GoodDeedService
  def self.conn
    Faraday.new(url: "http://localhost:3000")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.good_deeds
    get_url("/api/v1/good_deeds")
  end
end
