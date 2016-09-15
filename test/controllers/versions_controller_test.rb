require "test_helper"

class VersionControllerTest < ActionDispatch::IntegrationTest
  test "GET show should be successful" do
    get "/check.svg"
    assert_response :success
  end
end
