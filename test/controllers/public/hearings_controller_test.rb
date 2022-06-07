require "test_helper"

class Public::HearingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_hearings_new_url
    assert_response :success
  end

  test "should get show" do
    get public_hearings_show_url
    assert_response :success
  end
end
