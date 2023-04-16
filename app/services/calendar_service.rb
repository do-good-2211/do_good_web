class CalendarService
  def self.calendar_api
    service = Google::Apis::CalendarV3::CalendarService.new
  end
end
