class Api::V1::RedirectorController < ApplicationController

  def redirect_to_original
    short_url = params[:short_url]

    if short_url.present?
      short_uri = ShortUri.where(shorty: short_url.strip).first
      json_message = 
      if short_uri && short_uri.original_url.present?
      	short_uri.create_visit_details!
      	redirect_to short_uri.original_url  and return
      else
      	{error: "didn't find any url"}
      end
    else
    	json_message = {error: 'param short_url is absent'}
    end

    render json: json_message, status: :unprocessable_entity

  end

end