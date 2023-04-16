require 'rails_helper'

RSpec.describe Attendee do
  let (:info) { {"user_id": 2, "name": "Peter"} }
  let (:attendee1) { Attendee.new(info) }

  it "exists & has attributes" do
    expect(attendee1).to be_an(Attendee)
    expect(attendee1.name).to eq("Peter")
  end
end