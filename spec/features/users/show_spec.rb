require 'rails_helper'

RSpec.describe "/dashboard", type: :feature do
  describe "As a logged in user, when I visit the users's show page" do
    describe "when successful" do
      let(:image_url) { "https://images.unsplash.com/photo-1679227679356-7a3d5bd5d8be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzM0NTl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODA5NzUzMDE&ixlib=rb-4.0.3&q=80&w=400" }
      let(:deed1) { { id: "55", type: "good_deed", attributes: { host_name: "Sally", host_id: 2, name: "Deed1 High-five a stranger", date: "2024-02-02", time: "2000-01-01T16:00:00.000Z", status: "In Progress", media_link: nil, notes: nil, attendees: [{ name: "Tink"}, { name: "Hook" }] } } }
      let(:deed2) { { id: "44", type: "good_deed", attributes: { host_name: "Sally", host_id: 2, name: "Deed2 Donate Blood.", date: "2024-02-02", time: "2000-01-01T16:00:00.000Z", status: "Completed", media_link: image_url, notes: "fun", attendees: [{ name: "Sneezy"}, { name: "Grumpy" }] } } }
      let(:deed3) { { id: "33", type: "good_deed", attributes: { host_name: "John", host_id: 1, name: "Deed3 Pick up Trash.", date: "2024-02-02", time: "2000-01-01T16:00:00.000Z", status: "Completed", media_link: image_url, notes: "fun", attendees: [{ name: "Dory"}, { name: "Nemo" }] } } }
      let(:deed4) { { id: "22", type: "good_deed", attributes: { host_name: "John", host_id: 1, name: "Deed4 Tip Generously.", date: "2024-11-11", time: "2000-01-01T22:00:00.000Z", status: "In Progress", media_link: nil, notes: nil, attendees: [{ name: "Harry"}, { name: "Ron" }] } } }

      let(:user) { User.new(id: 1, attributes: { name: "John Smith", role: "User", good_deeds: { data: [ deed1, deed2, deed3, deed4 ]} } ) }
      let(:user2) { User.new(id: 2, attributes: { name: "Sally", role: "User" } ) }


      before(:each) do
        john = { id: 1, attributes: { name: "John Smith", email: "john@example.com", password_digest: "test1", role: "User" } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(john)
        allow_any_instance_of(UserFacade).to receive(:fetch_user).and_return(user)

        VCR.use_cassette('dashboard', serialize_with: :json) do
          visit '/dashboard'
        end
      end

      it "displays message, Random Act button, & three sections of good deeds" do
    
        expect(page).to have_content("John Smith's Do Good Page")
        # expect(page).to have_button("Choose New Random Act")
        
        expect(page).to have_content("You're Hosting!")
        within "#hosting-#{deed4[:id]}" do
          expect(page).to have_content("Deed4 Tip Generously.")
          expect(page).to have_content("2024-11-11")
          expect(page).to have_content("2000-01-01T22:00:00.000Z")
          expect(page).to have_content("Harry")
          expect(page).to have_content("Ron")
          # ADD: update button
        end

        expect(page).to have_content("You're Invited!")
        # within "#invited-#{deed.id}" do
        #   expect(page).to have_content("")
        #   # deed name, date, time, invitees, host name
        # end

        expect(page).to have_content("Past Good Deeds")
        # within "#completed-#{deed.id}" do
        #   expect(page).to have_content("")
        #   # That use was invited: 
        #   # deed name, date, time, invitees,host 
        # end
        # within "#completed-#{deed.id}" do
        #   expect(page).to have_content("")
        #   #That user hosted:
        #   # deed name, date, time, invitees, media_link update button
        # end
      end

    end

    describe "when NOT successful" do
    end
  end
end