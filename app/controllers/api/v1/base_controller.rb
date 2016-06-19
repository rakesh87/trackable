class Api::V1::BaseController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from StandardError, with: :misconduct_call

  def authentication_via_api_key
  	api_token = request.headers['TOKEN']
      @user = User.where(api_token: api_token).first if api_token
     
      unless @user
        render :head, status: :unauthorized
        return false
      end
  end

  private
  
    def record_not_found(error)
      render json: { data: { error: error.message } }, status: :not_found
    end

    def misconduct_call(exception)
      render json: { data: { error: exception.message } }, status: 500
    end

end