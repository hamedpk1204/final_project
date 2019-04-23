module Api
  module V1
    class UsersController < ApiController

        def create
        user = User.where(email: params[:email]).first

        if user.valid_password?(params[:password])
          render json: user.as_json(only: [:id, :email, :authentication_token]), status: :created
        else
          head(:unauthorized)
        end
      end

      def destroy

      end

      def index
        render json: User.all
      end

    end
  end
end
