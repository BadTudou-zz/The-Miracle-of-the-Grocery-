module SessionsHelper
	def log_in(guest)
 		session[:guest_id] = guest.id  
 	end

 	def log_out(guest)
 		session.delete(:guest_id) 
 		@current_guest = nil  
 	end

 	def logged_in?
 		!current_guest.nil?
	end

	def current_guest
      	@current_guest ||= Guest.find_by(id: session[:guest_id])  
    end

    def current_guest?(guest)
 		@guest == current_guest  
 	end

 	# 重定向到存储的地址，或者默认地址
  	def redirect_back_or(default)
 		redirect_to(session[:forwarding_url] || default) 
 		session.delete(:forwarding_url)  
 	end

  	# 存储以后需要获取的地址
  	def store_location
 		session[:forwarding_url] = request.url if request.get?  
 	end
end
