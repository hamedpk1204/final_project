class Api::CategoriesController < ApiController

  def index
    render json: Category.all
  end

  def show
    category = Category.find_by(id: params[:id])
    if category
      render json: category
    else
      render json: { error: 'Category not found'}, status: 404
    end
  end

  def search
    render json: Category.where('name LIKE ?', "%#{params[:name]}")
  end

end
