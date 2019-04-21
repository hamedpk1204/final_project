class Api::WorkCategoriesController < ApiController

  def index
    render json: WorkCategory.all
  end

  def show
    work_category = Work_category.find_by(id: params[:id])
    if work_category
      render json: work_category
    else
      render json: { error: 'Work_category not found'}, status: 404
    end
  end

  def search
    render json: Work_category.where('name LIKE ?', "%#{params[:name]}")
  end

end
