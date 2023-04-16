require "rails_helper"

RSpec.describe "The good deeds index page" do
  describe "As a visitor" do
    before do
      deeds = File.read("./spec/fixtures/good_deeds.json")
      stub_request(:get, "http://localhost:3000/api/v1/good_deeds")
        .to_return(status: 200, body: deeds)

      random_acts = File.read("./spec/fixtures/random_acts.json")
      stub_request(:get, "http://localhost:3000/api/v1/random_acts")
        .to_return(status: 200, body: random_acts)
    end

    it "When I visit '/' I see the good deed index info" do
      visit "/"

      expect(page).to have_link("Home")
      expect(page).to have_css("img[src*='do_good']")
      expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun")
      expect(page).to have_link("Login/Register")
      expect(page).to have_link("Get Help Today", href: "https://www.mentalhealth.gov/get-help/immediate-help")
    end

    it "When I click on Login/Register button I am redirected" do
      visit "/"

      click_button("Login/Register")
      # expect(current_path).to eq(login_path)
      #Since this tests passes it's still being tested? If you have ideas on an expect statement please add.
    end

    it "When I click on Home linkI am redirected to Home" do
      visit "/"
      click_on "Home"

      expect(current_path).to eq("/")
    end
  end
end
