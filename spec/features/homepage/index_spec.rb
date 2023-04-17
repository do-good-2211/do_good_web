require "rails_helper"

RSpec.describe "Home page", type: :feature do
  describe "As a visitor", :vcr do
    before do
      random_acts = File.read("./spec/fixtures/random_acts.json")
      stub_request(:get, "http://localhost:3000/api/v1/random_acts")
        .to_return(status: 200, body: random_acts)
    end

    describe "As a user who is NOT logged in", :vcr do
      it "When I visit '/' I see a link to home, a button to login/register, logo and moto, and footer" do
        visit "/"

        expect(page).to have_link("Home")
        expect(page).to have_css("img[src*='do_good']")
        expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun")
        expect(page).to have_link("Login/Register")
        expect(page).to have_link("Get Help Today", href: "https://www.mentalhealth.gov/get-help/immediate-help")
      end

      it "When I click on Login/Register button I am redirected" do
        visit "/"

        click_button("Login/Register")
        # expect(current_path).to eq(login_path) -> Now goes to Google OAuth
        # Since this tests passes it's still being tested? If you have ideas on an expect statement please add.
      end

      it "When I click on Home link I am redirected to Home" do
        visit "/"
        click_on "Home"

        expect(current_path).to eq("/")
      end
    end

    describe "As a logged in user", :vcr do
      it "should have a link to Log Out and My Page and Home" do
        user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
        visit root_path

        expect(page).to have_link("Home")
        expect(page).to have_link("Log Out")
        expect(page).to have_link("My Page")
      end
  
      it "when I click log out, I am redirected to the homepage" do
        user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        visit root_path
        click_on("Log Out")

        expect(page).to_not have_content("Log Out")
        expect(page).to_not have_content("My Page")
        # expect(page).to have_content("Successfully logged out")
      end

      it "has a link to My Page and redirects me to my dashboard" do
        user = { id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        
        visit root_path
        click_on("My Page")

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end
