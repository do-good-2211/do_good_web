class CalendarFacade
  def initialize
  end

  def create_event(email, attributes, token)
    CalendarService.calendar_api(token)

    event= Google::Apis::CalendarV3::Event.new(
      summary: "Date: #{params[date]}: Do Good Event!", 
      description: "#{params[:name]} at #{params[:time]} with #{params[:attendees].count} of your friends!",
      start: {date: "2023-07-30"},
      end: {date: "2023-07-30"}
    )
    service.insert_event(email, event)
  end

  def list_calendars(email, token)
    CalendarService.calendar_api(token).list_calendar_lists.items
  end
end
