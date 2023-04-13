require "rails_helper"

RSpec.describe UserService do
  before do
    user = File.read("./spec/fixtures/user.json")
    stub_request(:get, "https://localhost:3000/api/v1/users/1")
    .to_return(status: 200, body: user)

    all_users = File.read("./spec/fixtures/users.json")
    stub_request(:get, "https://localhost:3000/api/v1/users")
    .to_return(status: 200, body: all_users)
  end

  it "returns a json object of one user" do
    user = UserService.find_user(1)

    expect(user).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:name)
  end

  it "returns a json object of all the users" do
    users = UserService.find_all_users
    
    expect(users).to be_a(Hash)
    users[:data].each do |user|
      expect(user).to have_key(:id)
      expect(user).to have_key(:type)
      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to have_key(:name)
    end
  end
end