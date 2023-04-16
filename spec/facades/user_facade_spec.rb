require "rails_helper"

RSpec.describe UserFacade, :vcr do
  before do
    @facade = UserFacade.new({}, {id: 2, attributes: { name: "John Smith", role: "User" }})
  end

  describe "initialize" do
    it "exists" do
      expect(@facade).to be_instance_of(UserFacade)
    end
  end

  describe "#fetch_user" do
    it "returns one user object with its attributes" do
      user_1 = @facade.fetch_user

      expect(user_1).to be_an_instance_of(User)
      expect(user_1.name).to be_a(String)
      expect(user_1.id).to be_a(String)
    end
  end

  describe "fetch_all_users" do
    it "returns all user objects with their respective attributes" do
      users = @facade.fetch_all_users

      users.each do |user|
        expect(user).to be_an_instance_of(User)
        expect(user.name).to be_a(String)
        expect(user.id).to be_a(String)
      end
    end
  end

  describe "fetch_all_but_user" do
    it "returns all users excluding the designated user" do
      users = @facade.fetch_all_but_user

      users.each do |user|
        expect(user).to be_an_instance_of(User)
        expect(user.name).to be_a(String)
        expect(user.id).to be_a(String)
      end
    end
  end
end