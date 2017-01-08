class SessionsController < ApplicationController
  def new
  end

  def create
  	guest = Guest.find_by(name: params[:session][:name].downcase) 
  	if guest && guest.authenticate(params[:session][:password])
      log_in guest 
  		redirect_to guest
  	else
  		flash[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end
end
