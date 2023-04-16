# frozen_string_literal: true

# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def omniauth
    user = SessionsFacade.new.authorize_user(request.env["omniauth.auth"])
    session[:user] = user
   
    if current_user
      redirect_to "/dashboard"
    end

    session[:token] = request.env["omniauth.auth"][:credentials][:token]

    service = Google::Apis::CalendarV3::CalendarService.new

    service.authorization = session[:token]

    s = DateTime.new(2023, 12, 9, 12, 0, 0)
    e = DateTime.new(2023, 12, 9, 13, 0, 0)
 
    event= Google::Apis::CalendarV3::Event.new(
        summary: "Help people", 
        description: "Help people more",
        start: {date: "2023-07-30", dateTime: '2023-05-29T13:15:03Z', timeZone: 'local'},
        end: {date: "2023-07-30", dateTime: '2023-05-29T13:15:03Z', timeZone: 'local'}
    )

    service.insert_event("menyeart1@gmail.com", event)

    # Listing Calendar On A Page
    # @calendar_list = service.list_calendar_lists.items
  end
end
