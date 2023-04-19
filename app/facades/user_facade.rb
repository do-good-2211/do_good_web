# frozen_string_literal: true

# app/facades/user_facade.rb
class UserFacade
  attr_reader :good_deed,
              :user

  def initialize(params, current_user)
    @good_deed = params[:good_deed]
    @user = current_user
    @users ||= UserService.find_all_users[:data].map { |user| User.new(user) }
  end

  def fetch_user
    user_info = UserService.find_user(@user.id)
    User.new(user_info[:data])
  end

  def fetch_user_dashboard
    user = fetch_user
    all_deeds_array = user.good_deeds
    # make_deeds (helper method)
    array_of_deed_objects = all_deeds_array[:data].map do |deed_hash|
      Deed.new(deed_hash)
    end

    # sorted_deeds (helper method)
    hosting_deeds = []
    invited_deeds = []
    completed_deeds = []

    array_of_deed_objects.each do |deed|
      if deed.status == "Completed"
        completed_deeds << deed
      elsif deed.host_id == user.id && deed.status == "In Progress"
        hosting_deeds << deed
      else
        invited_deeds << deed
      end
    end

    # hash that is returned to the view: (helper method?)
    {
      name: user.name,
      id: user.id,
      role: user.role,
      hosting_deeds:,
      invited_deeds:,
      completed_deeds:
    }
  end

  def make_deed_objects(all_deeds)
    all_deeds.map do |deed_hash|
      Deed.new(deed_hash)
    end
  end

  def fetch_all_but_user
    @users.reject { |user| user.name == @user.name }
  end
end
