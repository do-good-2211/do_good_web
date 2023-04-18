require "rails_helper"

RSpec.describe "User good deed edit page" do
  describe "As a logged in user", :vcr do
    context "When I visit '/user/good_deeds/:id/edit" do
      before do
        @user = { "id" => "1", "attributes" => { "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

        visit edit_user_good_deed_path(4)

        @good_deed = GoodDeedFacade.new({ id: 4 }, 1).fetch_deed
      end

      it 'I see the name of the good deed and a form with the deed information prepopulated' do
        within 'section#edit_deed' do
          expect(page).to have_field(:name, with: @good_deed.name)
          expect(page).to have_field(:date)
          expect(page).to have_field(:time)
          expect(page).to have_content('Attendees')
          expect(page).to have_unchecked_field(:status)
          expect(page).to have_field(:notes)
          expect(page).to have_field(:media_link)
          expect(page).to have_button('Update Event')
        end

        within 'nav#delete_deed' do
          expect(page).to have_link('Delete Event')
        end
      end

      it 'When I check the completed box and click "Update Event", I am redirected to the dashboard' do
        check :status
        click_button 'Update Event'

        expect(current_path).to eq(dashboard_path)
      end

      it 'When I do not change anything and click "Update Event", I am redirected to the dashboard' do
        click_button 'Update Event'

        expect(current_path).to eq(dashboard_path)
      end

      it 'When I edit some fields and click "Update Event", I am redirected to the dashboard' do
        fill_in :date, with: Date.today
        fill_in :time, with: Time.now
        click_button 'Update Event'

        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end
