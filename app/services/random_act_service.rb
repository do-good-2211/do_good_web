# frozen_string_literal: true

# app/services/random_act_service.rb
class RandomActService
  def self.conn
    Faraday.new(url: "http://localhost:3000")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_acts
    get_url("/api/v1/random_acts")
  end
end
