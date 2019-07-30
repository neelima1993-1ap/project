class UsersController < ApplicationController
	#include Upload
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def populate_db
    file = upload_params["excel"].path
  	UploadDataJob.perform_later(file)
    redirect_to :back     
  end

  private

  def upload_params
  	params.require(:upload).permit(:excel)
  end
end
