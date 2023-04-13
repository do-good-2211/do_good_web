class SessionsController < ApplicationController 
  def omniauth 
    # request.env["omniauth.auth"]
    DoGoodService.create_user(request.env["omniauth.auth"])
    redirect_to login_path
  end
end