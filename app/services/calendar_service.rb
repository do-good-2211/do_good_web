class CalendarService
  def self.calendar_api
    Google::Apis::CalendarV3::CalendarService.new
  end
end
