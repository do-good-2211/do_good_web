# frozen_string_literal: true

# app/facades/good_deed_facade.rb
class GoodDeedFacade
  attr_reader :deed_id

  def initialize(params, host_name, id)
    @name = params[:name]
    @date = params[:date]
    @time = params[:time]
    @attendees = params[:attendees]
    @status = params[:status]
    @notes = params[:notes]
    @media_link = params[:media_link]
    @deed_id = params[:id]
    @host_name = host_name
    @user_id = id
  end

  def get_deeds
    GoodDeedService.good_deeds[:data].map { |deed| Deed.new(deed) }
  end

  def create_deed
    DoGoodService.create_deed(@user_id,
                              {
                                name: @name,
                                date: @date,
                                time: @time,
                                attendees: @attendees,
                                host_name: @host_name
                              })
  end

  def fetch_deed
    data = GoodDeedService.fetch_deed(@user_id, @deed_id)
    Deed.new(data[:data])
  end

  def update_deed
    deed_hash = {
      name: @name,
      date: @date,
      time: @time,
      status:,
      notes: @notes,
      media_link: @media_link
    }
    DoGoodService.update_deed(@user_id, @deed_id, deed_hash)
  end

  private

  def status
    @status = if @status == 1
                "Completed"
              else
                "In Progress"
              end
  end
end
