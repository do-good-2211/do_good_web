require "rails_helper"

RSpec.describe "Random Acts index page", type: :feature do
  describe "As a logged in user, when I visit '/random_acts'", :vcr do
    before do
      random_acts = File.read("./spec/fixtures/random_acts.json")
      stub_request(:get, "http://localhost:3000/api/v1/random_acts")
        .to_return(status: 200, body: random_acts)

      user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "I see 3 random acts and their name as a link" do
      visit '/random_acts'

      expect(page).to have_link("Deed 1")
      expect(page).to have_link("Deed 2")
      expect(page).to have_link("Deed 3")
    end
       
    it "when I click on any deed I am redirected to the new good deed page" do
      visit '/random_acts'
      click_on("Deed 1")

      expect(current_path).to eq("/user/good_deeds/new")
    end
  end
end
