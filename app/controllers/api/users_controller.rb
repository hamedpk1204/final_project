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

  def create
    user = Users.where(email:params[:email]).first
    if user&.valid_password?(params[:password])
      render json: user.as_jaso(only: [:id, :email, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end
    


  def search
    render json: User.where('name LIKE ?', "%#{params[:name]}")
  end

end
