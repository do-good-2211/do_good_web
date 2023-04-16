class CalendarService
  def self.calendar_api(token)
    Google::Apis::CalendarV3::CalendarService.new
    service.authorization = (token)
  end
end
