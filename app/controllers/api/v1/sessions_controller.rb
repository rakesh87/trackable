module Api
  module V1
    class SessionsController < BaseController

      def create
        user = User.find_by(email: session_params[:email])

        if user && user.authenticate(session_params[:password])
          render json: { email: user.email, api_token: user.api_token }, status: :ok
        else
          render json: { error: true, message: 'could not find any authentication' }, status: :unauthorized
        end

      end

      def index
        # render 'sessions/index.json.jbuilder'
      end

      private

        def session_params
          params.require(:user).permit(:email, :password)
        end
      
    end
  end
end
