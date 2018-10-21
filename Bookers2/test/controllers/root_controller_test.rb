require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get root_top_url
    assert_response :success
  end

end
