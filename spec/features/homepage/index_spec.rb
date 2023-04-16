require "rails_helper"

RSpec.describe "The good deeds index page" do
  describe "As a visitor" do
    before do
      deeds = File.read("./spec/fixtures/good_deeds.json")
      stub_request(:get, "http://localhost:5000/api/v1/good_deeds")
        .to_return(status: 200, body: deeds)

      random_acts = File.read("./spec/fixtures/random_acts.json")
      stub_request(:get, "http://localhost:5000/api/v1/random_acts")
        .to_return(status: 200, body: random_acts)
    end

    it "When I visit '/' I see the good deed index info" do
      visit "/"

      expect(page).to have_link("Home")
      expect(page).to have_have_css('img[src^="/assets/do_good.jpg"][alt="Do Good Logo"][class="mx-auto w-1/5 h-auto"]')
      expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun")
      expect(page).to have_button("Login/Register")
      expect(page).to have_link("Get Help Today")
    end

    it "When I click on Login/Register button I am redirected" do
      visit "/"
      click_on "Login/Register"

      expect(current_path).to eq("/login")
    end

    it "When I click on Home linkI am redirected to Home" do
      visit "/"
      click_on "Home"

      expect(current_path).to eq("/")
    end

    it "When I click on Get Help Now link I am redirected to a helpful link" do
      visit "/"
      click_on "Get Help Today"

      expect(current_path).to eq("https://www.mentalhealth.gov/get-help/immediate-help")
    end
  end
end
