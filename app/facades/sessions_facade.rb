# frozen_string_literal: true

# app/facades/sessions_facade.rb
class SessionsFacade
  def authorize_user(omni_hash)
    user_info = DoGoodService.create_user(omni_hash)[:data]
    {
      "id" => user_info[:id],
      "name" => user_info[:attributes][:name],
      "email" => user_info[:attributes][:email]
    }
  end
end
