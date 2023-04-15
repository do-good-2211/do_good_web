require "rails_helper"

RSpec.describe "Home page" do
  describe "As a visitor", :vcr do
    it "When I visit '/' I see the website name, a login/register link and a random acts button" do
      visit root_path

      expect(page).to have_content("Do Good")
      expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun")
      expect(page).to have_link("Login/Register")
      expect(page).to have_button("Random Acts")
    end

    it "When I click on Login/Register I am redirected" do
      visit root_path

      click_on "Login/Register"
      expect(current_path).to eq(login_path)
    end

    it "When I click on the Random Act button I am redirected to the random acts page" do
      visit root_path

      click_on "Random Act"
      expect(current_path).to eq(random_acts_path)
    end
  end
end
