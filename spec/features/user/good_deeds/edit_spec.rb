require "rails_helper"

RSpec.describe "User good deed edit page" do
  describe "As a logged in user", :vcr do
    context "When I visit '/user/good_deeds/:id/edit" do
      let(:deed1) { { id: "33", type: "good_deed", attributes: { host_name: "John Smith", host_id: 1, name: "Deed3 Pick up Trash.", date: "2024-05-30", time: "2000-01-01T14:00:00.000Z", status: "In Progress", media_link: nil, notes: "super fun", attendees: [{ name: "Dori"}, { name: "Nemo" }] } } }
      let(:deed2) { { id: "22", type: "good_deed", attributes: { host_name: "John Smith", host_id: 1, name: "Deed4 Tip Generously.", date: "2024-11-11", time: "2000-01-01T22:00:00.000Z", status: "In Progress", media_link: nil, notes: nil, attendees: [{ name: "Harry"}, { name: "Ron" }] } } }
      
      before do
        # @user = { "id" => "1", "name" => "Bob", "email" => "user@gmail.com", "password_digest" => "test1", "role" => "User" } 
        # @user = { id: 1, attributes: { name: "John Smith", role: "User", good_deeds: { data: [ deed1, deed2, deed3, deed4 ]} } }
        user = User.new(id: 1, attributes: { name: "John Smith", email: "user@gmail.com", role: "User", good_deeds: { data: [deed1, deed2] } } ) 

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)

        # Good Deed Edit Form for a user
        visit edit_user_good_deed_path(1)
        
        @good_deed = GoodDeedFacade.new({ id: 1 }, nil, 1).fetch_deed
         #<Deed:0x0000000114feec68 @attendees=[], @date="2024-02-02", @host_id=2, @host_name="Jean-Luc Picard", @id=1, @media_link=nil, @name="High-five a stranger.", @notes=nil, @status="In Progress", @time="4:00 PM">
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
