require "rails_helper"

RSpec.describe "User good deed new page" do
  describe "As a logged in user" do
    before do
      user = File.read("./spec/fixtures/user.json")
      stub_request(:get, "https://localhost:3000/api/v1/users/1")
        .to_return(status: 200, body: user)

      all_users = File.read("./spec/fixtures/users.json")
      stub_request(:get, "https://localhost:3000/api/v1/users")
        .to_return(status: 200, body: all_users)

      info = { attributes: { name: "Bob" } }
      user = User.new(info)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    xit "When I visit '/user/good_deeds/new' I see the name of the good deed, a from with fields for date, time and checkboxes for other users and a button 'Do Good'" do
      visit 'user_good_deeds_new_path'
      expect(page).to have_content
    end
  end
end
