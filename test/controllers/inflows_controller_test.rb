require 'test_helper'

class InflowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inflows_new_url
    assert_response :success
  end

end
