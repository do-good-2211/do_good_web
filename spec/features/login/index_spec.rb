require "rails_helper"

RSpec.describe "Login Page" do 
  before do 
    OmniAuth.config.mock_auth[:google_oauth2] = nil
    
    omni_hash
    visit login_path
    click_on "Log in with Google" 

    # @controller.stub(:env).and_return({"omniauth.auth" => OmniAuth.config.mock_auth[:google_oauth2]})  
    allow(@controller).to receive(:env).and_return({"omniauth.auth" => OmniAuth.config.mock_auth[:google_oauth2]})

  end

  describe "when I visit the login page", :vcr do 
    # xit" has a link to login with google" do 
    #   expect(page).to have_link("Log in with Google")
    # end

    it "takes me to log in with my google credentials" do 
      # click_on "Log in with Google"
      expect(current_path).to eq("/login")
      expect(page).to have_content("Welcome, John Smith!")
    end
  end
end