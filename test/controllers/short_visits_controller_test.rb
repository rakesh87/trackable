require 'test_helper'

class Api::V1::ShortVisitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @short_uri = short_uris(:one)
    @short_visit = short_visits(:one)
  end

  test "should get index" do
    get api_v1_short_uri_short_visits_url(@short_uri)
    assert_response :success
  end

  test "should show short_visit" do
    get api_v1_short_uri_short_visit_url(@short_uri, @short_visit)
    assert_response :success
  end

end
