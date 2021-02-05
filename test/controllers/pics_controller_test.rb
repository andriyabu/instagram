require "test_helper"

class PicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pics_index_url
    assert_response :success
  end
end
