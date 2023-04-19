# frozen_string_literal: true

# app/controllers/user/good_deeds_controller.rb
require 'aws-sdk-s3'
class User::GoodDeedsController < ApplicationController
  before_action :not_authorized

  def new
    @facade = UserFacade.new(params, current_user)
  end

  def create
    email = current_user.email
    if params[:date].present? && params[:time].present?
      GoodDeedFacade.new(params, current_user.name, current_user.id).create_deed
      CalendarFacade.new.create_event(email, params, session[:token])
      redirect_to dashboard_path
    else
      redirect_to new_user_good_deed_path
      flash[:notice] = "Please fill in all parts."
    end
  end

  def edit
    @facade = GoodDeedFacade.new(params, nil, current_user.id)
  end

  def update
    if params[:media_link].present?
      image = params[:media_link] #grabs the image to use in the aws method
      filename = "#{SecureRandom.uuid}.#{image.original_filename.split(".").last}" #formats the image filepath
      params[:media_link] = filename #do not remove, this saves the media link to the back end
    end
 
    aws(image, filename) #method is defined below, this is connecting to amazon web service and putting the
                        #image in the bucket
    
    GoodDeedFacade.new(params, nil, current_user.id).update_deed
    redirect_to dashboard_path
  end

  def aws(image, filename)
    s3 = Aws::S3::Client.new
    s3.put_object(bucket: ENV['S3_BUCKET_NAME'], key: filename, body: image.read)
  end

  def destroy
    GoodDeedFacade.new(params, nil, current_user.id).delete_deed
    redirect_to dashboard_path
  end
end
