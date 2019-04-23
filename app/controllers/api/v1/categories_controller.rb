module Api
  module V1
    class CategoriesController < ApiController
    before_action :authenticate_request!
      def index
        render json: Category.all
      end
      def show
        category = Category.find_by(id:params[:id])
        if category
          render json: category
        else
          render json: {error: 'category not found'}, status: 404
        end
      end
    end
  end
end
