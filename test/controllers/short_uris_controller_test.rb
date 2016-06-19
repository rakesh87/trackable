require 'test_helper'

class Api::V1::ShortUrisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @short_uri = short_uris(:one)
    @user = users(:one)
  end

  test "should get index" do
    get api_v1_user_short_uris_url(@user)
    assert_response :success
  end

  test "should create short_uri" do
    assert_difference('ShortUri.count') do
      post api_v1_user_short_uris_url(@user), params: { short_uri: { original_url: @short_uri.original_url, shorty: @short_uri.shorty } }
    end
    assert_response 201
  end

  test "should show short_uri" do
    get api_v1_user_short_uri_url(@user, @short_uri)
    assert_response :success
  end

end
