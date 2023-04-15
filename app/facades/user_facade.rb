# frozen_string_literal: true

# app/facades/user_facade.rb
class UserFacade
  def initialize; end

  def create_user(user_id)
    user_info = UserService.find_user(user_id)
    User.new(user_info[:data])
  end

  def create_all_users
    UserService.find_all_users[:data].map { |user| User.new(user) }
  end
end
