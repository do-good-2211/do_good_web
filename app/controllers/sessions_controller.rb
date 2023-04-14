class SessionsController < ApplicationController 
  def omniauth 
    # require 'pry'; binding.pry
    user_response = DoGoodService.create_user(request.env["omniauth.auth"])
    user = User.new(user_response[:data])
    session[:user_id] = user.id 
    flash[:message] = "Welcome, #{user.name}!"
    
    
    redirect_to "/login"
  end
end