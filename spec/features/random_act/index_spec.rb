require "rails_helper"

RSpec.describe "Random Acts index page", type: :feature do
  describe "As a logged in user, when I visit '/random_acts'", :vcr do
    before do
      user = User.new(id: 1, attributes: { name: "John Smith", email: "user@gmail.com", role: "User", good_deeds: { data: [] } })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette('random_acts', serialize_with: :json) do
        @random_acts = ["Volunteer at a local animal shelter", "Donate blood at a local blood center", "Contribute code or a monetary donation to an open-source software project"]
        visit '/random_acts'
      end
    end

    it "I see 3 random acts and their name as a link" do
      expect(page).to have_link("Find a charity and donate to it")
      expect(page).to have_link("Volunteer at a local animal shelter")
      expect(page).to have_link("Volunteer at your local food pantry")
    end

    it "when I click on any deed I am redirected to the new good deed page" do
      click_on("Volunteer at a local animal shelter")
      expect(current_path).to eq("/user/good_deeds/new")
    end
  end
end
