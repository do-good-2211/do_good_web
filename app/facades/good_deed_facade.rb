# frozen_string_literal: true

# app/facades/good_deed_facade.rb
class GoodDeedFacade
  def initialize(params, host_name, id)
    @name = params[:name]
    @date = params[:date]
    @time = params[:time]
    @attendees = params[:attendees]
    @host_name = host_name
    @id = id
  end

  def get_deeds
    GoodDeedService.good_deeds[:data].map { |deed| Deed.new(deed) }
  end

  def create_deed
    deed = DoGoodService.create_deed(@id,
                                     {
                                       name: @name,
                                       date: @date,
                                       time: @time,
                                       attendees: @attendees,
                                       host_name: @host_name
                                     })
                                    
    Deed.new(deed[:data])
  end
end
