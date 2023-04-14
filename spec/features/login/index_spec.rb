require "rails_helper"

RSpec.describe "Login Page" do
  describe "when I visit the login page", :vcr do
    it " has a link to login with google" do
      expect(page).to have_link("Log in with Google")
    end
  end

  before do
    OmniAuth.config.mock_auth[:google_oauth2] = nil

    omni_hash
    visit login_path
    click_on "Log in with Google"
  end

  describe "when I visit the login page", :vcr do
    it "takes me to log in with my google credentials" do
      expect(current_path).to eq("/login")
      expect(page).to have_content("Welcome, John Smith!")
    end
  end
end
