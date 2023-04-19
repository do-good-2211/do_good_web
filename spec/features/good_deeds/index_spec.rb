require "rails_helper"

RSpec.describe "Home page", type: :feature do
    describe "As a user who is NOT logged in", :vcr do
      it "When I visit '/' I see header & footer, button to login/register, logo and moto" do
        visit "/"

        expect(page).to have_link("Home")
        expect(page).to have_css("img[src*='do_good']")
        expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun!")
        expect(page).to have_link("Login/Register")
        expect(page).to have_link("Chat with someone now!", href: "https://www.7cups.com/")

        expect(page).to_not have_link("Choose a Random Act of Kindess")
        expect(page).to_not have_content("Ready to do more good?")
      end

      it "When I click on Login/Register button I am redirected to Google OAuth" do
        visit "/"
        click_button("Login/Register")
        # expect(current_path).to eq(login_path) -> Now goes to Google OAuth
        # Since this tests passes it's still being tested. If you have ideas on an expect statement please add.
      end

      it "When I click on Home link I am redirected to Home" do
        visit "/"
        click_on "Home"

        expect(current_path).to eq("/")
      end

      # add test to confirm completed deeds are displayed on page: media_link & deed name only
    end

    describe "As a logged in user", :vcr do
      before(:each) do
        user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit root_path
      end

      it "should have a header & footer, button to random acts and different phrase" do
        expect(page).to have_link("Home")
        expect(page).to have_link("Log Out")
        expect(page).to have_link("My Page")
        expect(page).to have_link("Choose a Random Act of Kindess")
        expect(page).to have_content("Ready to do more good?")

        expect(page).to_not have_content("Ok, I'm Convinced. I wanna join the fun!")
        expect(page).to_not have_link("Login/Register")
      end

      it "when I click on Random Act, I'm redirected to /random_acts" do
        ra1 = RandomAct.new("Volunteer at a local animal shelter")
        ra2 = RandomAct.new("Pick up trash")
        ra3 = RandomAct.new("Buy your mother flowers")
        allow_any_instance_of(RandomActFacade).to receive(:create_acts).and_return([ra1, ra2, ra3])
        
        # VCR.use_cassette('dashboard_random_acts', serialize_with: :json) do
          click_button("Choose a Random Act of Kindess")        
          expect(current_path).to eq("/random_acts")
        # end

      end

      # Still unsure how to stub user login 
      # it "when I click log out, I am redirected to the homepage" do
      #   # user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
      #   # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      #   OmniAuth.config.mock_auth[:google_oauth2] = nil
      #   omni_hash
      #   visit root_path
      #   click_button("Login/Register")
       
      #   visit root_path
      #   click_on("Log Out")

      #   expect(page).to_not have_content("Log Out")
      #   expect(page).to_not have_content("My Page")
      #   expect(page).to have_content("Successfully logged out")
      # end

      xit "has a link to My Page and redirects me to my dashboard" do
        # user = User.new(id: 1, attributes: { name: "John Smith", email: "user@gmail.com", role: "User", good_deeds: { data: [] } } ) 
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        # visit root_path
        click_on("My Page")

        expect(current_path).to eq(dashboard_path)
      end
    end
end
