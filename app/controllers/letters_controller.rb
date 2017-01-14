class LettersController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  before_action :logged_in_guest, only: [:new, :edit, :show, :update]
  before_action :correct_guest,   only: [:new, :edit, :show, :update]

  def index
    #@letters = Letter.all
    @letters = Letter.paginate(:page => params[:page],:per_page => 2)
  end

  def new
  	@letter = Letter.new
  end

  def show
    @letter = Letter.find(params[:id])
  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def create
    receiver = Guest.where("name = ? ", params[:letter][:receiver]).first
    @letter = Letter.new(letter_params)
    @letter.receiver = receiver[:id]
    @letter.sender = session[:guest_id]

    logger.debug @letter.inspect

    if @letter.save
      redirect_to @letter
    else
      render 'new'
    end
  end

  def update
    @letter = Letter.find(params[:id])

    if @letter.update(letter_params)
      redirect_to @letter
    else
      render 'edit'
    end
  end

  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
 
    redirect_to letters_path
  end

  private
    def letter_params
      params.require(:letter).permit(:sender, :content, :receiver, :created_at)
    end

end
