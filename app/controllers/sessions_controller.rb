class SessionsController < ApplicationController
  def new
  end

  def create
  	guest = Guest.find_by(name: params[:session][:name].downcase) 
  	if guest && guest.authenticate(params[:session][:password])
      log_in guest 
  		redirect_back_or guest
  	else
  		flash[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
    log_out redirect_to login_path
  end
end
