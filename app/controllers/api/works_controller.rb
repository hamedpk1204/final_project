class Api::WorksController < ApiController

  def index
    render json: Work.all
  end

  def show
    work = Work.find_by(id: params[:id])
    if work
      render json: work
    else
      render json: { error: 'Work not found'}, status: 404
    end
  end

  def create
    work = Works.new(title: params[:title], description: params[:description])
    if work.save
      render json: work
    else
      render json: { error: 'Cannot create book' }, status: 404
    end
  end




  def search
    render json: Work.where('name LIKE ?', "%#{params[:name]}")
  end

end
