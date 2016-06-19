require 'open-uri'
require 'json'

class ShortUri < ApplicationRecord

  belongs_to :user
  
  has_many :short_visits

  paginates_per 10

  def create_visit_details!(visit_params: ParseGeoData.new.visits_params)
    self.short_visits.create(visit_params)
  rescue Errno::ENETUNREACH => e 
    { error: e.message }
  end
  
end


private

  module FreeGeoIp

    URL = "https://freegeoip.net"
    FORMAT = "/json"

    def self.get
      open(geo_api_endpoint).read
    end

    def self.to_json
      JSON.parse(get)
    end

    def self.geo_api_endpoint
      "#{URL}#{FORMAT}"
    end

  end

  class ParseGeoData

    def initialize(data=FreeGeoIp.to_json)
      @data = data
    end

    attr_reader :data

    def visits_params
      params = {}
      params[:visitor_ip] = ip
      params[:visitor_city] =  city
      params[:visitor_state] = state
      params[:visitor_country_iso2] = country

      params
    end


    private
    
      def ip
        data.fetch('ip', nil)
      end

      def country
        data.fetch('country_name', nil)
      end

      def state
        data.fetch('region_name', nil)
      end

      def city
        data.fetch('city', '')
      end

      def latitude
        data.fetch('latitude', '')
      end

      def longitude
        data.fetch('latitude', '')
      end

  end
