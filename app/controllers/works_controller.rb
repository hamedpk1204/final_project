class WorksController < ApplicationController
  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:notice] = "New Work Was Successfully Created"
      redirect_to work_path(@work)
    else
      render 'new'
    end
  end

  def show
    @work = Work.find(params[:id])

  end

  private
    def work_params
      params.require(:work).permit(:title, :description)
    end


end
