# frozen_string_literal: true

# app/facades/user_facade.rb
# frozen_string_literal: true

# app/facades/user_facade.rb
class UserFacade
  attr_reader :good_deed,
              :user

  def initialize(params, user)
    @good_deed = params[:good_deed]
    @user = user
    @users ||= UserService.find_all_users[:data].map { |user| User.new(user) }
  end

  def fetch_user
    user_info = UserService.find_user(@user[:id])
    User.new(user_info[:data])
  end

  def fetch_user_dashboard
    user = fetch_user
    all_deeds = user.good_deeds


    array_of_deed_objects = all_deeds[:data].map do |deed_hash|
      # require 'pry'; binding.pry
      new_hash = { 
        id: deed_hash[:id], 
        attributes: { 
          name: deed_hash[:name],
          host_id: deed_hash[:host_id],                 
          date: deed_hash[:date],         
          time: deed_hash[:time],
          status: deed_hash[:status],
          notes: deed_hash[:notes],
          media_link: deed_hash[:media_link],
          #attendees: 
        } 
      }
      Deed.new(new_hash)
    end

    # sorted_deeds = sort_deeds(array_of_deed_objects)
    hosting_deeds = []
    invited_deeds = []
    completed_deeds = []
    
    array_of_deed_objects.each do |deed|
      if deed.status == "Completed"
        completed_deeds << deed
      elsif deed.host_id == user.id # && deed[:status] == "In Progress" 
        hosting_deeds << deed
      else
        invited_deeds << deed
      end
    end

    {
    name: user.name,
    id: user.id,
    role: user.role,
    hosting_deeds: hosting_deeds,
    invited_deeds: invited_deeds,
    completed_deeds: completed_deeds
    }
  end

  ##### Helper:
  def make_deed_objects(all_deeds)
    all_deeds.map do |deed_hash|
      Deed.new(deed_hash)
    end
  end
  #########

  def fetch_all_users
    @users
  end

  def fetch_all_but_user
    @users.reject { |user| user.name == @user["name"] }
  end
end
