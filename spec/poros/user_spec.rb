require 'rails_helper'

RSpec.describe User do
  let(:info) { { name: "Peter Pan", email: "the_pan@neverland.com", password_digest: "NeverGrowUp", role: "User" } }
  let(:peter) { User.new(info) }

  it "exists & has attributes" do
    expect(peter).to be_a(User)
    expect(peter.name).to eq("Peter Pan")
    expect(peter.email).to eq("the_pan@neverland.com")
    expect(peter.password_digest).to eq("NeverGrowUp")
    expect(peter.role).to eq("User")
  end
end
