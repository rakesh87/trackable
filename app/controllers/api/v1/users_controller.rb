module Api
  module V1
    class UsersController < BaseController

      def show
        set_user
        
        render json: @user
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end

      end

      private

        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
      
    end
  end
end
