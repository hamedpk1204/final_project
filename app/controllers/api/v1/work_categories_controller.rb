module Api
  module V1
    class WorkCategoriesController < ApiController
    before_action :authenticate_request!
      def index
        render json: WorkCategory.all
      end
      def show
        work_category = WorkCategory.find_by(id:params[:id])
        if work_category
          render json: work_category
        else
          render json: {error: 'Work_category not found'}, status: 404
        end
      end
    end
  end
end
