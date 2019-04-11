class WorksController < ApplicationController

  def new
    @work = Work.new
  end

  def create
    #render plain: params[:work].inspect
    @work = Work.new(work_params)
    @work.save
    redirect_to works_show(@work)
  end

  private
    def work_params
      params.require(:work).permit(:title, :description)
    end


end
