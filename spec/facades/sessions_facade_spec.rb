require "rails_helper"

RSpec.describe SessionsFacade do
  before(:each) do
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    @facade = SessionsFacade.new

    omni_hash
  end

  describe "#authorize_user", :vcr do
    it "can get a google oauth hash to search for or create a user o the back end" do
      expect(@facade.authorize_user(OmniAuth.config.mock_auth[:google_oauth2])).to be_a(User)
      expect(@facade.authorize_user(OmniAuth.config.mock_auth[:google_oauth2]).name).to eq("John Smith")
      expect(@facade.authorize_user(OmniAuth.config.mock_auth[:google_oauth2]).role).to eq("user")
    end
  end
end
