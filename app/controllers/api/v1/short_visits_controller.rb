module Api
  module V1
    class ShortVisitsController < BaseController

      before_action :load_short_uri
      before_action :set_short_visit, only: [:show]

      def index
        @short_visits = @short_uri.short_visits

        render json: @short_visits
      end

      def show
        render json: @short_visit
      end

      def create
        @short_visit = @short_uri.short_visits.new(short_visit_params)

        if @short_visit.save
          render json: @short_visit, status: :created
        else
          render json: @short_visit.errors, status: :unprocessable_entity
        end
        
      end


      private

        def set_short_visit
          @short_visit = @short_uri.short_visits.find(params[:id])
        end

        def load_short_uri
          @short_uri = ShortUri.find(params[:short_uri_id])
        end

        def short_visit_params
          params.require(:short_visit).permit(:visitor_ip, :visitor_city, :visitor_state, :visitor_country_iso2)
        end
    end
  end
end