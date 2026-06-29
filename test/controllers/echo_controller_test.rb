require "test_helper"

class EchoControllerTest < ActionDispatch::IntegrationTest
  test "GET /echo echoes the message param" do
    get "/echo", params: { message: "hello" }
    assert_response :success
    assert_equal "hello", JSON.parse(@response.body)["message"]
  end

  test "GET /echo returns empty string when message is missing" do
    get "/echo"
    assert_response :success
    assert_equal "", JSON.parse(@response.body)["message"]
  end
end
