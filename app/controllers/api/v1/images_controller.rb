module Api
  module V1
    class ImagesController < ApiController
    before_action :authenticate_request!
      def index
        render json: Image.all
      end
      def show
        image = Image.find_by(id:params[:id])
        if image
          render json: image
        else
          render json: {error: 'Image not found'}, status: 404
        end
      end
    end
  end
end
