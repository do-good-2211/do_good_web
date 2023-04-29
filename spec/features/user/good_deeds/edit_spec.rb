require "rails_helper"

RSpec.describe "User good deed edit page" do
  describe "As a logged in user", :vcr do
    context "When I visit '/user/good_deeds/:id/edit" do
      let(:deed1) do
        { id: "33", type: "good_deed",
          attributes: { host_name: "John Smith", host_id: 1, name: "Deed3 Pick up Trash.", date: "2024-05-30", time: "2000-01-01T14:00:00.000Z", status: "In Progress", media_link: nil, notes: "super fun", attendees: [{ name: "Dori" }, { name: "Nemo" }] } }
      end
      let(:deed2) do
        { id: "22", type: "good_deed",
          attributes: { host_name: "John Smith", host_id: 1, name: "Deed4 Tip Generously.", date: "2024-11-11", time: "2000-01-01T22:00:00.000Z", status: "In Progress", media_link: nil, notes: nil, attendees: [{ name: "Harry" }, { name: "Ron" }] } }
      end

      before do
        user = User.new(id: 1, attributes: { name: "John Smith", email: "user@gmail.com", role: "User", good_deeds: { data: [deed1, deed2] } })
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)

        visit edit_user_good_deed_path(2)

        @good_deed = GoodDeedFacade.new({ id: 2 }, nil, 1).fetch_deed
      end

      it 'I see the name of the good deed and a form with the deed information prepopulated' do
        within 'section#edit_deed' do
          expect(page).to have_field(:name, with: @good_deed.name, type: :hidden)
          expect(page).to have_field(:date, type: :hidden)
          expect(page).to have_field(:time, type: :hidden)
          expect(page).to have_unchecked_field(:status, type: :hidden)
          expect(page).to have_field(:notes)
          expect(page).to have_field(:media_link)
          expect(page).to have_button('Update Event')
        end

        expect(page).to have_button('Delete Event')
      end

      it 'When I update the time, and click "Update Event", I am redirected to the dashboard' do
        visit edit_user_good_deed_path(3)

        @good_deed = GoodDeedFacade.new({ id: 3 }, nil, 1).fetch_deed

        fill_in :notes, with: "what a great time we had"
        allow_any_instance_of(User::GoodDeedsController).to receive(:aws).and_return("123.jpg")
        click_button 'Update Event'

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Event updated!')
      end

      it 'When I do not change anything and click "Update Event", I am redirected to the dashboard' do
        allow_any_instance_of(User::GoodDeedsController).to receive(:aws).and_return("123.jpg")
        click_button 'Update Event'

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Event updated!')
      end

      it 'When I edit some fields and click "Update Event", I am redirected to the dashboard' do
        allow_any_instance_of(User::GoodDeedsController).to receive(:aws).and_return("123.jpg")
        fill_in :notes, with: "what a great time we had"
        click_button 'Update Event'

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Event updated!')
      end
    end
  end
end
