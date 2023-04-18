require "rails_helper"

RSpec.describe "The calendar service", :vcr do
  describe "Class Methods" do
    it "returns a json object" do
      service = CalendarService.calendar_api
      expect(service.base_path).to eq("calendar/v3/")
      expect(service.batch_path).to eq("batch/calendar/v3")
    end
  end
end