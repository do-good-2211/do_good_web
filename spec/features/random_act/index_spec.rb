require "rails_helper"

RSpec.describe "Random Acts index page", type: :feature do
  describe "As a visitor", :vcr do
    before do
      VCR.use_cassette('random_acts', serialize_with: :json) do
        @random_acts = RandomActFacade.new.create_acts

        visit '/random_acts'
      end
    end

    it "When I visit '/random_acts' I see 3 random acts and their name as a link" do
      expect(page).to have_link(@random_acts.first.name)
      expect(page).to have_link(@random_acts.second.name)
      expect(page).to have_link(@random_acts.last.name)
    end

    it "As a non-login User, when I click on any deed I am redirected" do
      click_on(@random_acts.first.name)

      expect(current_path).to eq(login_path)
      expect(page).to have_content("You must be logged in to create a new good deed")
    end

    it "As a logged-in User, when I click on any deed I am redirected to the new good deed page" do
      user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/random_acts'

      click_on(@random_acts.first.name)

      expect(current_path).to eq("/user/good_deeds/new")
    end
  end
end
