class GuestsController < ApplicationController
  before_action :logged_in_guest, only: [:edit, :show, :update]
  before_action :correct_guest,   only: [:edit, :show, :update]  
  before_action :store_keeper, only: [:index ,:destroy]
  def index
    @guests = Guest.all
  end

  def new
  	@guest = Guest.new
  end

  def show
    @guest = Guest.find(params[:id])
    # get_guest_letters
    # get_guest_letters_send
    # get_geust_letters_receive
    
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      flash[:success] = "Welcome to the he TMiracle of the Grocery !"
      redirect_back_or @guest
    else
      render 'new'
    end
  end

  def update
    @guest = Guest.find(params[:id])

    if @guest.update(guest_params)
      redirect_to @guest
    else
      render 'edit'
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
 
    redirect_to guests_path
  end

  private
    def guest_params
      params.require(:guest).permit(:name, :password)
    end

    def store_keeper
      redirect_to(guests_path) unless current_guest.storekeeper?    
    end

end
