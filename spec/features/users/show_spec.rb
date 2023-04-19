require 'rails_helper'

RSpec.describe "/dashboard", type: :feature do
  describe "As a logged in user, when I visit the users's show page" do
    describe "when successful" do
      let(:image_url) { "https://images.unsplash.com/photo-1679227679356-7a3d5bd5d8be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzM0NTl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODA5NzUzMDE&ixlib=rb-4.0.3&q=80&w=400" }
      let(:deed1) { { id: "55", type: "good_deed", attributes: { host_name: "Sally Seashells", host_id: 2, name: "Deed1 High-five a stranger", date: "2024-09-10", time: "2000-01-01T13:00:00.000Z", status: "In Progress", media_link: nil, notes: nil, attendees: [{ name: "Tink"}, { name: "Hook" }] } } }
      let(:deed2) { { id: "44", type: "good_deed", attributes: { host_name: "Sally Seashells", host_id: 2, name: "Deed2 Donate Blood.", date: "2024-02-02", time: "2000-01-01T16:00:00.000Z", status: "Completed", media_link: image_url, notes: "fun", attendees: [{ name: "Sneezy"}, { name: "Grumpy" }] } } }
      let(:deed3) { { id: "33", type: "good_deed", attributes: { host_name: "John Smith", host_id: 1, name: "Deed3 Pick up Trash.", date: "2024-05-30", time: "2000-01-01T14:00:00.000Z", status: "Completed", media_link: image_url, notes: "super fun", attendees: [{ name: "Dori"}, { name: "Nemo" }] } } }
      let(:deed4) { { id: "22", type: "good_deed", attributes: { host_name: "John Smith", host_id: 1, name: "Deed4 Tip Generously.", date: "2024-11-11", time: "2000-01-01T22:00:00.000Z", status: "In Progress", media_link: nil, notes: nil, attendees: [{ name: "Harry"}, { name: "Ron" }] } } }

      let(:user) { User.new(id: 1, attributes: { name: "John Smith", email: "john@gmail.com", role: "User", good_deeds: { data: [ deed1, deed2, deed3, deed4 ]} } ) }
      let(:user2) { User.new(id: 2, attributes: { name: "Sally Seashells", role: "User" } ) }

      before(:each) do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        allow_any_instance_of(UserFacade).to receive(:fetch_user).and_return(user)
        allow_any_instance_of(CalendarFacade).to receive(:list_events).and_return(12)

        VCR.use_cassette('dashboard', serialize_with: :json) do
          visit '/dashboard'
        end
      end

      it "displays message, Random Act button, & three sections of good deeds" do
        expect(page).to have_content("John Smith's Do Good Page")
        # expect(page).to have_button("Choose a Random Act of Kindess!") might need to change after adding Tailwind
        expect(page).to have_link("Choose a Random Act of Kindess!")

        expect(page).to have_content("You're Hosting!")
        within "#hosting-#{deed4[:id]}" do
          expect(page).to have_css("img[src*='upcoming_good']")
          expect(page).to have_content("Deed4 Tip Generously.")
          expect(page).to have_content("2024-11-11")
          expect(page).to have_content("2000-01-01T22:00:00.000Z".to_datetime.strftime("%l:%M %p").strip)
          expect(page).to have_content("Harry")
          expect(page).to have_content("Ron")
          expect(page).to have_link("Update")
        end

        expect(page).to have_content("You're Invited!")
        within "#invited-#{deed1[:id]}" do
          expect(page).to have_css("img[src*='upcoming_good']")
          expect(page).to have_content("Deed1 High-five a stranger")
          expect(page).to have_content("2024-09-10")
          expect(page).to have_content("2000-01-01T13:00:00.000Z".to_datetime.strftime("%l:%M %p").strip)
          expect(page).to have_content("Sally Seashells")
          expect(page).to have_content("Tink")
          expect(page).to have_content("Hook")
        end

        expect(page).to have_content("Past Good Deeds")
        # Completed & Hosted
        within "#completed-#{deed3[:id]}" do
          expect(page).to have_content("Deed3 Pick up Trash.")
          expect(page).to have_content("2024-05-30")
          expect(page).to have_content("2000-01-01T14:00:00.000Z".to_datetime.strftime("%l:%M %p").strip)
          expect(page).to have_content("Dori")
          expect(page).to have_content("Nemo")
          expect(page).to have_content("super fun")
          expect(page).to have_css("img[src*='#{image_url}']")
          expect(page).to have_link("Update")
        end

        # Completed & Invited
        within "#completed-#{deed2[:id]}" do
          expect(page).to have_content("Deed2 Donate Blood.")
          expect(page).to have_content("2024-02-02")
          expect(page).to have_content("2000-01-01T16:00:00.000Z".to_datetime.strftime("%l:%M %p").strip)
          expect(page).to have_content("Sneezy")
          expect(page).to have_content("Grumpy")
          expect(page).to have_content("fun")
          expect(page).to have_css("img[src*='#{image_url}']")
        end
      end

      it "when I click on the Random Acts button, I'm redirected to /random_acts" do
        ra1 = RandomAct.new("Volunteer at a local animal shelter")
        ra2 = RandomAct.new("Pick up trash")
        ra3 = RandomAct.new("Buy your mother flowers")
        allow_any_instance_of(RandomActFacade).to receive(:create_acts).and_return([ra1, ra2, ra3])
        
        VCR.use_cassette('random_acts', serialize_with: :json) do
          click_on("Choose a Random Act of Kindess!")        
          # click_button("Choose a Random Act of Kindess!") Add after Tailwind
          expect(current_path).to eq("/random_acts")
        end
      end

      it "when I click on the Update button under You're Hosting, I'm redirected to /user/good_deeds/:id/edit" do
        deed4_object = Deed.new( { id: "22", type: "good_deed", attributes: { host_name: "John Smith", host_id: 1, name: "Deed4 Tip Generously.", date: "2024-11-11", time: "2000-01-01T22:00:00.000Z", status: "In Progress", media_link: nil, notes: nil, attendees: [{ name: "Harry"}, { name: "Ron" }] } } )
        allow_any_instance_of(GoodDeedFacade).to receive(:fetch_deed).and_return(deed4_object)

        within "#hosting-#{deed4[:id]}" do
            click_on("Update")
            # click_button("Update") Add after Tailwind
          end
          expect(current_path).to eq("/user/good_deeds/#{deed4_object.id}/edit")
      end

      it "when I click on the Update button under Past Good Deeds that were hosted, I'm redirected to /user/good_deeds/:id/edit" do
        deed3_object = Deed.new( { id: "33", type: "good_deed", attributes: { host_name: "John Smith", host_id: 1, name: "Deed3 Pick up Trash.", date: "2024-05-30", time: "2000-01-01T14:00:00.000Z", status: "Completed", media_link: image_url, notes: "super fun", attendees: [{ name: "Dori"}, { name: "Nemo" }] } } )
        allow_any_instance_of(GoodDeedFacade).to receive(:fetch_deed).and_return(deed3_object)

        within "#completed-#{deed3[:id]}" do
          click_on("Update")
            # click_button("Update") Add after Tailwind
          end
          expect(current_path).to eq("/user/good_deeds/#{deed3_object.id}/edit")
      end
    end

    describe "when NOT successful" do
    end
  end
end