require "test_helper"

class Public::SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_spots_show_url
    assert_response :success
  end
end
