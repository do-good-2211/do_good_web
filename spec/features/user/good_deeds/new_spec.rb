require "rails_helper"

RSpec.describe "User good deed new page" do
  describe "As a logged in user", :vcr do
    context "When I visit '/user/good_deeds/new" do
      before do
        @user = User.new(id: 1, attributes: { name: "John Smith", email: "user@gmail.com", role: "User", good_deeds: { data: [] } } ) 
        # @user = { "id" => "1", "attributes" => { "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)


        ra1 = RandomAct.new("Volunteer at a local animal shelter")
        ra2 = RandomAct.new("Pick up trash")
        ra3 = RandomAct.new("Buy your mother flowers")
        allow_any_instance_of(RandomActFacade).to receive(:create_acts).and_return([ra1, ra2, ra3])

        VCR.use_cassette('random_acts', serialize_with: :json) do
          visit random_acts_path
          click_link "Volunteer at a local animal shelter", match: :first
        end

        @users = UserFacade.new({ good_deed: "Volunteer at a local animal shelter" }, @user).fetch_all_but_user
      end

      it "I see the name of the good deed, a form with fields for date, time and checkboxes for other users and a button 'Do Good'" do
        expect(page).to have_content('Volunteer at a local animal shelter')

        within '#new_good_deed' do
          expect(page).to have_field(:date)
          expect(page).to have_field(:time)
          expect(page).to have_content(@users.first.name)
          expect(page).to have_button("Create Good!")
        end
      end

      xit 'When I fill in all parts of the form and click "Create Good!" I am taken to my user dashboard' do
        # allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)

        # Start here when I return: 
        # @user = { "id" => "1", "attributes" => { "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" } }
        # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        within '#new_good_deed' do
          fill_in :date, with: Date.today
          fill_in :time, with: Time.now

          # find(:css, "#attendees_#{@users.second.id}").set true
          # find(:css, "#attendees_#{@users.last.id}").set true
          click_button 'Create Good!'

          expect(current_path).to eq(dashboard_path)
        end
      end

      it 'When I leave the date or time blank and click "Create Good!" I am redirected to the new page with a message' do
        within '#new_good_deed' do
          fill_in :date, with: Date.today

          find(:css, "#attendees_#{@users.first.id}").set true
          find(:css, "#attendees_#{@users.last.id}").set true
          click_button 'Create Good!'
        end

        expect(current_path).to eq(new_user_good_deed_path)
        expect(page).to have_content("Please fill in all parts.")
      end
    end
  end
end
