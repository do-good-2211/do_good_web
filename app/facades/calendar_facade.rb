class CalendarFacade
  def initialize; end

  def create_event(email, attributes, token)
    service = CalendarService.calendar_api
    service.authorization = token

    event = Google::Apis::CalendarV3::Event.new(
      summary: "Do Good Event! Date: #{attributes[:date]}",
      description: "#{attributes[:name]} at #{attributes[:time]}!",
      start: { date: attributes[:date] },
      end: { date: attributes[:date] }
    )
    service.insert_event(email, event)
  end

  def list_events(token)
    service = CalendarService.calendar_api
    service.authorization = token
    service.list_events("primary").items.map { |event| event if event.summary && event.summary.include?("Do Good") }.compact.count
  end
end
