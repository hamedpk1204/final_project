class Api::UsersController < ApiController

  def index
    render json: User.all
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { error: 'Work not found'}, status: 404
    end
  end

  def search
    render json: User.where('name LIKE ?', "%#{params[:name]}")
  end

end
