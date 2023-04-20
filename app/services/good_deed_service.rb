# frozen_string_literal: true

# app/services/good_deed_service.rb
class GoodDeedService
  def self.conn
    Faraday.new(url: "https://warm-temple-59633.herokuapp.com/")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.good_deeds
    get_url("/api/v1/good_deeds")
  end

  def self.fetch_deed(user_id, deed_id)
    get_url("/api/v1/users/#{user_id}/good_deeds/#{deed_id}")
  end

  def self.delete_deed(user_id, deed_id)
    conn.delete("/api/v1/users/#{user_id}/good_deeds/#{deed_id}")
  end
end
