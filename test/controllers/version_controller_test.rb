require "test_helper"

class VersionControllerTest < ActionDispatch::IntegrationTest
  test "GET /version returns app/rails/ruby identifiers" do
    get "/version"
    assert_response :success

    body = JSON.parse(@response.body)
    assert_equal "demo-rails-app", body["app"]
    assert_equal Rails::VERSION::STRING, body["rails"]
    assert_equal RUBY_VERSION, body["ruby"]
  end
end
