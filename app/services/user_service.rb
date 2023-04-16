# frozen_string_literal: true

# app/services/user_service.rb
class UserService
  def self.conn
    Faraday.new(url: "http://localhost:3000")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_user(user_id)
    get_url("/api/v1/users/#{user_id}")
  end

  def self.find_all_users
    get_url("/api/v1/users")
  end
end
