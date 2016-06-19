require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user_a = users(:one)
  	@user_b = users(:two)
  end

  def test_api_token
  	assert_respond_to @user_a, :api_token
  	assert_respond_to @user_b, :api_token
  end

  
end
