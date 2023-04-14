Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
OmniAuth.config.allowed_request_methods = %i[get]

# OmniAuth.config.test_mode = true
# OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({ 
#   "provider" => "google_oauth2",
#   "uid" => "100000000000000000000",
#   "info" => {
#     "name" => "John Smith",
#     "email" => "john@example.com"
  
# }})