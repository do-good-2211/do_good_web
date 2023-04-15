# frozen_string_literal: true

# app/facades/sessions_facade.rb
class SessionsFacade
  def authorize_user(omni_hash)
    user_response = DoGoodService.create_user(omni_hash)
    User.new(user_response[:data])
  end
end
