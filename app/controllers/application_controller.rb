class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  	 def logged_in_guest
      unless logged_in? 
        store_location
        flash[:danger] = "Please log in." 
        redirect_to login_path 
      end
    end

    def correct_guest
       @guest = Guest.find(session[:guest_id]) 
       redirect_to(guests_path) unless current_guest?(@guest)
    end
end
