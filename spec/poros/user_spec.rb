require 'rails_helper'

RSpec.describe User do
  let(:info) {{ id: 1, attributes: {name: "Peter Pan", role: "User" }} }
  let(:peter) { User.new(info) }

  it "exists & has attributes" do
    expect(peter).to be_a(User)
    expect(peter.name).to eq("Peter Pan")
    expect(peter.role).to eq("User")
  end
end
