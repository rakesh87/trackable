require 'test_helper'

class ShortUriTest < ActiveSupport::TestCase

  def setup
  	@short_uri = short_uris(:one)
  end

  def test_create_visit_details
  	params = {}
    params[:visitor_ip] = '1.1.0.127'
    params[:visitor_city] =  'bangalore'
    params[:visitor_state] = 'karnataka'
    params[:visitor_country_iso2] = 'india'

  	result = @short_uri.create_visit_details!(visit_params: params)
  	assert_kind_of ShortVisit, result
  	assert_equal 'bangalore', result.visitor_city
  	assert_equal 'karnataka', result.visitor_state
  	assert_equal '1.1.0.127', result.visitor_ip
  end

  ## private classes test doen't matter :)
end
