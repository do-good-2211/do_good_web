require "rails_helper"

RSpec.describe "User good deed new page", type: :feature do
  describe "As a logged in user", :vcr do
    before do
      user = User.new(id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" })
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      VCR.use_cassette('random_acts', serialize_with: :json) do
        @random_acts = RandomActFacade.new.create_acts
        @users = UserFacade.new({good_deed: @random_acts.first.name}).fetch_all_users
        
        visit random_acts_path

        click_link @random_acts.first
      end
    end

    xit "When I visit '/user/good_deeds/new' I see the name of the good deed, a form with fields for date, time and checkboxes for other users and a button 'Do Good'" do
      expect(page).to have_content(@random_acts.first.name)
      expect(page).to have_field(:date)
      expect(page).to have_field(:time)
      expect(page).to have_unchecked_field (@users.first.name)
      expect(page).to have_uncheckted
    end  
  end
end