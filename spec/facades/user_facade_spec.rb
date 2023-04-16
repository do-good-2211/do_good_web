require "rails_helper"

RSpec.describe UserFacade, :vcr do
  before do
    @facade = UserFacade.new
  end

  describe "initialize" do
    it "exists" do
      expect(@facade).to be_instance_of(UserFacade)
    end
  end

  # describe "#create_user" do
  #   it "returns one user object with its attributes" do
  #     user_id = 1
  #     user_1 = @facade.create_user(user_id)

  #     expect(user_1).to be_an_instance_of(User)
  #     expect(user_1.name).to be_a(String)
  #     expect(user_1.id).to be_a(String)
  #   end
  # end

  describe "create_all_users" do
    it "returns all user objects with their respective attributes" do
      users = @facade.create_all_users

      users.each do |user|
        expect(user).to be_an_instance_of(User)
        expect(user.name).to be_a(String)
        expect(user.id).to be_a(String)
      end
    end
  end
end
