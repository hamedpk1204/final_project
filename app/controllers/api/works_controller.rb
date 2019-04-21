class Api::WorksController < ApiController

  def index
    works = Work.all
    render json: works
  end

end
