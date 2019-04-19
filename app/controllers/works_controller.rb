class WorksController < ApplicationController
  before_action :set_work, only: [:update, :edit, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @works = Work.paginate(page: params[:page], per_page: 5)
  end

  def new
    @work = Work.new
  end

  def edit
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user
    if @work.save
      flash[:success] = "New Work Was Successfully Created"
      redirect_to work_path(@work)
    else
      render 'new'
    end
  end

  def update
    if @work.update(work_params)
      flash[:success] = "Work was successfully updated"
      redirect_to work_path(@work)
    else
      render 'edit'
    end

  end

  def show
  end

  def destroy
    @work.destroy
    flash[:danger] = "Work was successfully deleted"
    redirect_to works_path
  end

  private
    def set_work
      @work = Work.find(params[:id])
    end
    def work_params
      params.require(:work).permit(:title, :description)
    end

    def require_same_user
      if current_user !=@work.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own work"
        redirect_to root_path
      end
    end


end
