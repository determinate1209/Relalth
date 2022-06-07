require "test_helper"

class Public::MenuItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_menu_items_edit_url
    assert_response :success
  end
end
