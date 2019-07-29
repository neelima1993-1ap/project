class SuppliersController < ApplicationController
	#include Upload
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  

  def show
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products.where(active: true)
  end

end
