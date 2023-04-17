require 'rails_helper'

RSpec.describe "/dashboard", type: :feature do
  describe "As a logged in user, when I visit the users's show page" do
    describe "when successful" do
      let(:deed1) { Deed.new( { id: "55", type: "good_deed", attributes: { name: "Deed1 High-five a stranger", media_link: "www.image.com/high_five_yo!" } } ) }
      let(:user) { User.new(id: 1, attributes: { name: "John Smith", role: "User", good_deeds: [ deed1 ] } ) }

      before(:each) do
        john = { id: 1, attributes: { name: "John Smith", email: "john@example.com", password_digest: "test1", role: "User" } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(john)
  # require 'pry'; binding.pry
        allow_any_instance_of(UserFacade).to receive(:fetch_user).and_return(user)

        VCR.use_cassette('dashboard', serialize_with: :json) do
          # @facade = UserFacade.new(params, john).fetch_user
          # @random_acts = ["Volunteer at a local animal shelter", "Donate blood at a local blood center", "Contribute code or a monetary donation to an open-source software project"]
          visit '/dashboard'
        end
      end

      it "displays message, Random Act button, & three sections of good deeds" do
        # save_and_open_page
        expect(page).to have_content("John Smith's Do Good Page")
        expect(page).to have_button("Choose New Random Act")
        
        expect(page).to have_content("You're Hosting!")
        # within "#hosting-#{deed.id}" do
        #   expect(page).to have_content("")
        #   # deed name, date, time, invitees, update button
        # end

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