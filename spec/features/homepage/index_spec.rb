require "rails_helper"

RSpec.describe "The good deeds index page" do
  describe "As a visitor" do
    before do
      deeds = File.read("./spec/fixtures/good_deeds.json")
      stub_request(:get, "https://localhost:3000/api/v1/good_deeds").to_return(status: 200, body: deeds)
    end

    it "When I visit '/' I see the good deed index info" do
      visit "/"

      expect(page).to have_content("Do Good")
      expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun")
      expect(page).to have_link("Login/Register")
      expect(page).to have_button("Random Acts")
    end

    it "When I click on Login/Register I am redirected" do
      visit "/"

      click_on "Login/Register"
      expect(current_path).to eq("/login")
    end

    it "When I click on Random Act button I am redirected" do
      visit "/"
      
      click_on "Random Act"
      expect(current_path).to eq("/random_acts")
    end
  end
end