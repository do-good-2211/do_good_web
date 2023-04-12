require "rails_helper"

RSpec.describe "The good deeds index page" do
  describe "As a visitor" do
    before do
      deeds = File.read("spec/fixtures/homepage/good_deeds.json")
      stub_request(:get, "https://localhost:3000/api/v1/good_deeds").to_return(status: 200, body: deeds)
    end
    it "When I visit '/' I see the good deed index info" do
      visit "/"

      expect(page).to have_content("Do Good")
      expect(page).to have_link("Homepage")
      expect(page).to have_link("Login")
      expect(page).to have_link("Register")
      expect(page).to have_button("Random Acts")
    end
  end
end