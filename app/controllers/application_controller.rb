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

    def get_guest_letters
      @guest_letters = Letter.where("sender = ? OR receiver = ?", session[:guest_id], session[:guest_id])
    end

    def get_geust_letters_receive
      @guest_letters_receive = Letter.where(receiver: session[:guest_id])
    end

    def get_guest_letters_send
      @guest_letters_send = Letter.where(sender: session[:guest_id])
    end

end
