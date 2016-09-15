require "test_helper"

class DownloadsControllerTest < ActionDispatch::IntegrationTest
  test "GET index should be successful" do
    get downloads_path

    assert_response :success
  end
end
