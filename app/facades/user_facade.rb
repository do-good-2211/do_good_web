class UserFacade
  attr_reader :good_deed,
              :user

  def initialize(params, user)
    @good_deed = params[:good_deed]
    @user = user
  end

  def fetch_user
    user_info = UserService.find_user(@user[:id])
    User.new(user_info[:data])
  end

  def fetch_all_users
    users ||= UserService.find_all_users[:data].map { |user| User.new(user) }
  end

  def fetch_all_but_user
    fetch_all_users.select { |user| user.name != @user[:attributes][:name]}
  end
end