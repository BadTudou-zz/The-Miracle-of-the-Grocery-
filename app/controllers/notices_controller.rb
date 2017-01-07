class NoticesController < ApplicationController
	def index
    @notices = Notice.all
  end

  def new
  	@notice = Notice.new
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to @notice
    else
      render 'new'
    end
  end

  def update
    @notice = Notice.find(params[:id])

    if @notice.update(notice_params)
      redirect_to @notice
    else
      render 'edit'
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
 
    redirect_to notices_path
  end

  private
    def notice_params
      params.require(:notice).permit(:title, :content, :publisher, :created_at)
    end
end
