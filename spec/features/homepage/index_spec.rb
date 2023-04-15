require "rails_helper"

RSpec.describe "Home page" do
  describe "As a visitor", :vcr do
    it "When I visit '/' I see the website name, a login/register link and a random acts button" do
      visit root_path

      expect(page).to have_content("Do Good")
      expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun")
      expect(page).to have_link("Log In")
      expect(page).to have_button("Random Acts")
    end

    it "When I click on Login/Register I am redirected" do
      visit root_path

      click_on "Log In"
      expect(current_path).to eq(login_path)
    end

    it "When I click on the Random Act button I am redirected to the random acts page" do
      visit root_path

      click_on "Random Act"
      expect(current_path).to eq(random_acts_path)
    end

    it "I can see a link to log in but not a link to log out" do 
      visit root_path

      expect(page).to have_link("Log In")
      expect(page).to_not have_link("Log Out")
    end
  end

  describe "As a logged in user", :vcr do 
    it "should have a link to logout" do 
      user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      expect(page).to_not have_link("Log In")
      expect(page).to have_link("Log Out")
    end

    it "when I click log out, I am redirected to the homepage and I see a link to log in" do 
      visit root_path 

      expect(page).to have_link("Log In")
      click_on("Log In")
      expect(current_path).to eq(login_path)
      click_on("Log in with Google")
      
      visit root_path

      click_on("Log Out")
      expect(page).to have_content("Log In")
      expect(page).to_not have_content("Log Out")
    end
  end
end
