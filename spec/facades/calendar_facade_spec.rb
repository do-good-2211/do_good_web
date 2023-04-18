require "rails_helper"

RSpec.describe CalendarFacade, :vcr do
  before do
    @facade = CalendarFacade.new
  end

  describe "initialize" do
    it "exists" do
      expect(@facade).to be_instance_of(CalendarFacade)
    end
  end
end
