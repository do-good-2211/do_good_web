require "rails_helper"

RSpec.describe "Random Acts index page", type: :feature do
  describe "As a visitor", :vcr do
    before do
      VCR.use_cassette('random_acts', serialize_with: :json) do
        @random_acts = ["Find a charity and donate to it", "Donate blood at a local blood center" ,"Pick up litter around your favorite park"]

        visit '/random_acts'
      end

      user = {id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" }}
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "When I visit '/random_acts' I see 3 random acts and their name as a link" do
      expect(page).to have_link(@random_acts.first)
      expect(page).to have_link(@random_acts.second)
      expect(page).to have_link(@random_acts.last)
    end

    it "As a logged-in User, when I click on any deed I am redirected to the new good deed page" do
      click_on(@random_acts.first)

      expect(current_path).to eq("/user/good_deeds/new")
    end
  end
end
