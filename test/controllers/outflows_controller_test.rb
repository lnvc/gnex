require 'test_helper'

class OutflowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get outflows_new_url
    assert_response :success
  end

end
