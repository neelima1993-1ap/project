class UsersController < ApplicationController
	#include Upload
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception


  def index
    #@suppliers = Supplier.all
    @suppliers = Supplier.joins(:products).uniq.sort_by{|s| s.active}.reverse
  	@user =  current_user
  end

  def populate_db
    p upload_params
    file = upload_params["excel"].path
    p file
  	UploadDataJob.perform_later(file)
    redirect_to :back     
  end

  private
  def upload_params
  	params.require(:upload).permit(:excel)
  end
end
