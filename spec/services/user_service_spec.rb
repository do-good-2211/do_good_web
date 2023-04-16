require "rails_helper"

RSpec.describe UserService, :vcr do
  it "returns a json object of one user" do
    user = UserService.find_user(1)

    # expect(user).to be_a(Hash)
    # # expect(user[:data]).to have_key(:id)
    # expect(user[:data]).to have_key(:type)
    # expect(user[:data]).to have_key(:attributes)
    # expect(user[:data][:attributes]).to have_key(:name)
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
