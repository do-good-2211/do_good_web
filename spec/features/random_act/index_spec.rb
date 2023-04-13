require "rails_helper"

RSpec.describe "Random Acts index page" do
  describe "As a visitor" do
    before do
      random_acts = File.read("./spec/fixtures/random_acts.json")
      stub_request(:get, "https://localhost:3000/api/v1/random_acts")
      .to_return(status: 200, body: random_acts)
    end

    it "When I visit '/random_acts I see 3 random acts and their name as a link" do
      visit '/random_acts'

      expect(page).to have_link("Deed 1")
      expect(page).to have_link("Deed 2")
      expect(page).to have_link("Deed 3")
    end

    it "As a non-login User, when I click on any deed I am redirected" do
      visit '/random_acts'

      click_on("Deed 1")

      expect(current_path).to eq(login_path)
      expect(page).to have_content("You must be logged in to create a new good deed")
    end

    it "As a login User, when I click on any deed I am redirected to" do
      info = { attributes:{name: "Bob"} }
      user = User.new(info)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/random_acts'

      click_on("Deed 1")
      expect(current_path).to eq("/user/good_deeds/new")
    end
  end
end
