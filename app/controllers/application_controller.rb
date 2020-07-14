class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart, :configure_permitted_parameters, if: :devise_controller?

  private
  	def set_cart
  		@cart = Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		@cart = Cart.create
  		session[:cart_id] = @cart.id  		
  	end

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
  		devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone_number, :description])
  	end

end
