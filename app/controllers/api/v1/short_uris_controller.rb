module Api
  module V1
    class ShortUrisController < BaseController

      before_action :load_user
      before_action :set_short_uri, only: [:show, :destroy]

      def index
        @short_uris = @user.short_uris.page params[:page]

        render json: @short_uris
      end

      def show
        render json: @short_uri
      end

      def create
        @short_uri = @user.short_uris.new(short_uri_params)

        if @short_uri.save
          render json: @short_uri, status: :created, location: api_v1_user_short_uris_url(@user)
        else
          render json: @short_uri.errors, status: :unprocessable_entity
        end

      end

      def destroy
        @short_uri.destroy
      end


      private

        def set_short_uri
          @short_uri = @user.short_uris.find(params[:id])
        end

        def load_user
          @user = User.find(params[:user_id])
        end

        def short_uri_params
          params.require(:short_uri).permit(:original_url, :shorty, :user_id)
        end

        def need_user_authentication(error)
          render json: { data: { error: "authentication missing" } }, status: 500
        end
      
    end
  end
end