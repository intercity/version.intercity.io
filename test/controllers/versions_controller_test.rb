require "test_helper"

class VersionControllerTest < ActionDispatch::IntegrationTest
  test "GET show should be successful" do
    ENV["LATEST_IC_VERSION"] = "0.2.0"

    get "/check.svg?version=0.1.0"
    assert_equal update_available_image, response.body

    get "/check.svg?version=0.2.0"
    assert_equal up_to_date_image, response.body

    assert_response :success
  end

  private

  def up_to_date_image
    File.read(Rails.root.join("app", "assets", "images", "up_to_date.svg"))
  end

  def update_available_image
    File.read(Rails.root.join("app", "assets", "images", "update_available.svg"))
  end
end
