module Api
  module V1
    class WorksController < ApiController
    before_action :authenticate_request!
      def index
        render json: Work.all
      end
      def show
        work = Work.find_by(id:params[:id])
        if work
          render json: work
        else
          render json: {error: 'Work not found'}, status: 404
        end
      end
    end
  end
end
