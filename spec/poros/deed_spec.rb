require 'rails_helper'

RSpec.describe Deed do
  let(:info) {
    { id: "55",
      type: "good_deed",
      attributes: {
        name: "High-five a stranger",
        date: "2024-02-02",
        time: "2000-01-01T16:00:00",
        status: "In Progress",
        notes: "This was awesome!",
        media_link: "www.image.com/high_five_yo!",
        attendees: [{ "user_id": 2, "name": "Peter" }, { "user_id": 3, "name": "Jane" }],
        # host_name: "Captain Sparrow",
        # host_id: "22"
      } }
  }
  let(:deed1) { Deed.new(info) }

  it "exists & has attributes" do
    expect(deed1).to be_a(Deed)
    expect(deed1.id).to eq(55)
    expect(deed1.name).to eq("High-five a stranger")
    expect(deed1.date).to eq("2024-02-02")
    expect(deed1.time).to eq("4:00 PM")
    expect(deed1.media_link).to eq("www.image.com/high_five_yo!")
    # expect(deed1.attendees).to be_an Array
    # expect(deed1.attendees.count).to eq(2)
    # expect(deed1.attendees.first.name).to eq("Peter")
  end
end
