class UserFacade
  attr_reader :good_deed

  def initialize(params, session)
    @good_deed = params[:good_deed]
    @user = session[:user]
  end

  def fetch_user(user_id)
    user_info = UserService.find_user(user_id)
    User.new(user_info[:data])
  end

  def fetch_all_users
    users ||= UserService.find_all_users[:data].map { |user| User.new(user) }
  end

  def fetch_all_but_user
    users.select { |user| @user.name}
  end
end