require "rails_helper"
# require "./app/facades/user_facade"

RSpec.describe UserFacade do
  before do
    user = File.read("./spec/fixtures/user.json")
    stub_request(:get, "https://localhost:3000/api/v1/users/1")
    .to_return(status: 200, body: user)

    all_users = File.read("./spec/fixtures/users.json")
    stub_request(:get, "https://localhost:3000/api/v1/users")
    .to_return(status: 200, body: all_users)

    @facade = UserFacade.new
  end

  describe "initialize" do
    it "exists" do
      expect(@facade).to be_instance_of(UserFacade)
    end
  end

  describe "#methods" do
    it "returns one user object with its attributes" do
      user_id = 1
      user_1 = @facade.create_user(user_id)

      expect(user_1).to be_an_instance_of(User)
      expect(user_1.name).to be_a(String)
      expect(user_1.id).to be_a(String)
    end

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