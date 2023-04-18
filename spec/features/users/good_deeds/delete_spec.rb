require "rails_helper"

RSpec.describe "Delete Good Deed" do
  describe "As a logged in user", :vcr do
    context "When I visit '/user/good_deeds/:id/edit" do
      before do
        @user = { "id" => "1", "attributes" => { "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

        visit edit_user_good_deed_path(5)

        @good_deed = GoodDeedFacade.new({ id: 5 }, 1).fetch_deed
      end

      it 'Has a link to delete the event' do
        within '#delete_deed' do
          expect(page).to have_link('Delete Event')
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