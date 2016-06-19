require 'test_helper'

class RoutingTest < ActionDispatch::IntegrationTest

  test "routes to sessions index" do
    assert_generates "/api/v1", controller: "api/v1/sessions", action: "index"
  end

  test "routes to sessions create" do
    assert_generates "/api/v1/sessions", controller: "api/v1/sessions", action: "create"#, id: "1"
  end

  test "routes to users create" do
    assert_generates "/api/v1/users", controller: "api/v1/users", action: "create"#, id: "1"
  end

  test "routes to short_uris index" do
    assert_generates "/api/v1/users/1/short_uris", controller: "api/v1/short_uris", action: "index", user_id: "1"
  end

  test "routes to short_uris create" do
    assert_generates "/api/v1/users/1/short_uris", controller: "api/v1/short_uris", action: "create", user_id: "1"
  end

  test "routes to short_uris show" do
    assert_generates "/api/v1/users/1/short_uris/1", controller: "api/v1/short_uris", action: "show", user_id: "1", id: "1"
  end

  test "routes to short_uris destroy" do
    assert_generates "/api/v1/users/1/short_uris/1", controller: "api/v1/short_uris", action: "destroy", user_id: "1", id: "1"
  end

  test "routes to short_visits index" do
    assert_generates "/api/v1/short_uris/1/short_visits", controller: "api/v1/short_visits", action: "index", short_uri_id: "1"
  end

  test "routes to short_visits show" do
    assert_generates "/api/v1/short_uris/1/short_visits/1", controller: "api/v1/short_visits", action: "show", short_uri_id: "1", id: "1"
  end

  test "routes to redirector redirect_to_original" do
    assert_generates "/api/v1/way-original", controller: "api/v1/redirector", action: "redirect_to_original"
  end

end