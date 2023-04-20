require "rails_helper"

RSpec.describe "Home page", type: :feature do
  describe "As a user who is NOT logged in", :vcr do
    it "When I visit '/' I see header & footer, button to login/register, logo and moto" do
      visit "/"

      expect(page).to have_link("Home")
      expect(page).to have_css("img[src*='do_good']")
      expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun!")
      expect(page).to have_link("Login/Register")
      expect(page).to have_link("Chat with someone now!", href: "https://www.7cups.com/")

      expect(page).to_not have_link("Choose a Random Act of Kindess")
      expect(page).to_not have_content("Ready to do more good?")
    end

    # it "When I click on Login/Register button I am redirected to Google OAuth" do
    #   visit "/"
    #   click_button("Login/Register")
    #   expect(current_path).to eq(login_path)
    # end

    it "When I click on Home link I am redirected to Home and I see completed good deeds" do
      visit "/"
      click_on "Home"

      expect(current_path).to eq("/")
      expect(page).to have_content("Ok, I'm Convinced. I wanna join the fun!")
      expect(page).to have_content("Mow your neighbor's lawn")
      expect(page).to have_content("Made website for cousin")
      expect(page).to have_content("Feed Camels")
      expect(page).to have_content("Volunteer at your local food bank")
    end
  end

  describe "As a logged in user", :vcr do
    before(:each) do
      user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path
    end

    it "should have a header & footer, button to random acts and different phrases" do
      expect(page).to have_link("Home")
      expect(page).to have_link("Log Out")
      expect(page).to have_link("My Page")
      expect(page).to have_link("Choose a Random Act of Kindess")
      expect(page).to have_content("Ready to do more good?")

      expect(page).to_not have_content("Ok, I'm Convinced. I wanna join the fun!")
      expect(page).to_not have_link("Login/Register")
    end

    it "when I click on Random Act, I'm redirected to /random_acts" do
      ra1 = RandomAct.new("Volunteer at a local animal shelter")
      ra2 = RandomAct.new("Pick up trash")
      ra3 = RandomAct.new("Buy your mother flowers")
      allow_any_instance_of(RandomActFacade).to receive(:create_acts).and_return([ra1, ra2, ra3])

      click_link("Choose a Random Act of Kindess")

      expect(current_path).to eq("/random_acts")
    end

    it "has a link to My Page and redirects me to my dashboard" do
      user = User.new(id: 1, attributes: { name: "John Smith", email: "user@gmail.com", role: "User", good_deeds: { data: [] } } )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)
      visit root_path
      click_on("My Page")

      expect(current_path).to eq(dashboard_path)
    end
  end
end
