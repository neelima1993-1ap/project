class SuppliersController < ApplicationController
	#include Upload
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  def index 
    @suppliers = Supplier.joins(:products).uniq.sort_by{|s| s.active}.reverse
    @user =  current_user
  end

  def show
    @supplier = Supplier.find(params[:id])
    @show_all = params["show_all"] || 'false'
    @products = @supplier.products
    @products = @products.where(active: true) if @show_all == 'false'
   	respond_to do |format|
   		format.html { }
		  format.js { }
    end
  end

end
