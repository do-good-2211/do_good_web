require "rails_helper"

RSpec.describe "User good deed edit page" do
  describe "As a logged in user", :vcr do
    context "When I visit '/user/good_deeds/:id/edit" do
      before do
        @user = { id: 1, attributes: { name: "Bob", email: "user@example.com", password_digest: "test1", role: "User" } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

        visit edit_user_good_deed_path(1)

        good_deed = GoodDeedFacade.new({id: 1}, 1)
      end

      it ''
    end
  end
end