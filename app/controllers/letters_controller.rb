class LettersController < ApplicationController
  def new
  	@letter = Letter.new
  end

  def show
  end

  def create
  		@letter = Letter.new(letter_params)
  		@letter.save
  		render plain: @letter.inspect
  end

  private 
  	def letter_params
  		params.permit(:receiver, :content, :sender)
  	end

end
