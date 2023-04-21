require "rails_helper"

RSpec.describe "Delete Good Deed" do
  describe "As a logged in user", :vcr do
    context "When I visit '/user/good_deeds/:id/edit" do
      before do
        @user = User.new(id: 1, attributes: { name: "John Smith", email: "user@gmail.com", role: "User", good_deeds: { data: [] } })

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)

        visit edit_user_good_deed_path(2)

        @good_deed = GoodDeedFacade.new({ id: 1 }, nil, 1).fetch_deed
      end

      it 'Has a link to delete the event if the event is in progress' do
        within '#delete_deed' do
          expect(page).to have_link('Delete Event')
        end
      end

      it 'Does not have a link to delete the event if the event is completed' do
        check 'Completed'
        click_button 'Update Event'
        visit edit_user_good_deed_path(1)

        within '#delete_deed' do
          expect(page).to_not have_link('Delete Event')
        end
      end

      it 'When I click on the delete link, I am taken to the dashboard' do
        within '#delete_deed' do
          click_link 'Delete Event'
        end

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end
