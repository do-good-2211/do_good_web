require "rails_helper"

RSpec.describe "Random Acts index page", type: :feature do
  describe "When I visit '/random_acts'", :vcr do
    before do
      user = { id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" } }
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette('random_acts', serialize_with: :json) do
        @random_acts = ["Contribute code or a monetary donation to an open-source software project", "Contribute code or a monetary donation to an open-source software project", "Clean out your closet and donate the clothes you've outgrown"]

        visit '/random_acts'
      end
    end

    it "I see 3 random acts and their name as a link" do
      expect(page).to have_link(@random_acts.first)
      expect(page).to have_link(@random_acts.second)
      expect(page).to have_link(@random_acts.last)
    end

    it "As a logged-in User, when I click on any deed I am redirected to the new good deed page" do
      click_on(@random_acts.first, match: :first)

      expect(current_path).to eq("/user/good_deeds/new")
    end
  end
end
