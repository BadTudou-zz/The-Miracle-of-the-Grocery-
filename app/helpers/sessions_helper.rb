module SessionsHelper
	def log_in(guest)
 		session[:guest_id] = guest.id  
 	end
 	def logged_in?
 		!current_guest.nil?
	end

	def current_guest
      	@current_guest ||= Guest.find_by(id: session[:guest_id])  
    end
end
