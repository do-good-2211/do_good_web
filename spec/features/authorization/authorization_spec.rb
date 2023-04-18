require "rails_helper"

RSpec.describe "Authorization" do
  describe "As a visitor/ not logged in user", :vcr do
    it "When clicking 'My Page or naviagting to /dashboard, I see a message that I do not have access, and I'm redirected to the home page'" do
      allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)
      visit root_path
      visit dashboard_path

      expect(page).to have_content("You are not authorized to access this page")
    end

    it "When I am logged in as a user I can view my dashboard" do
      user = { "id" => "1", "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" }
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)
      visit root_path
      click_on "My Page"

      expect(current_path).to eq(dashboard_path)
      expect(page).to_not have_content("You are not authorized to access this page")
    end

    it "When naviagting to /random_acts, I see a message that I do not have access, and I'm redirected to the home page'" do
      visit random_acts_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are not authorized to access this page")
    end

    it "When I am logged in as a user, I can visit /random_acts" do
      user = { "id" => "1", "attributes" => { "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" } }
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit random_acts_path
      expect(current_path).to eq(random_acts_path)
      expect(page).to_not have_content("You are not authorized to access this page")
    end

    it "When navigating to /good_deeds/new, I see a message that I do not have access, and I'm redirected to the home page'" do
      visit new_user_good_deed_path
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You are not authorized to access this page")
    end

    it "When I am logged in as a user, I can visit the new good deed page" do
      user = { "id" => "1", "attributes" => { "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" } }
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_user_good_deed_path
      expect(current_path).to eq(new_user_good_deed_path)
      expect(page).to_not have_content("You are not authorized to access this page")
    end
  end
end
