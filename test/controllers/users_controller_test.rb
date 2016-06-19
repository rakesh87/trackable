require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  # test "should get index" do
  #   get api_v1_users_url
  #   assert_response :success
  # end

  test "should create user" do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { email: @user.email, password: 'p@ssword', password_confirmation:  'p@ssword'} }
    end

    assert_response 201
  end

  # test "should show user" do
  #   get api_v1_user_url(@user)
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch api_v1_user_url(@user), params: { user: { api_token: @user.api_token, email: @user.email, password_digest: @user.password_digest } }
  #   assert_response 200
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete api_v1_user_url(@user)
  #   end

  #   assert_response 204
  # end
end
