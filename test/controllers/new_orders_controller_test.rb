require 'test_helper'

class NewOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_orders_index_url
    assert_response :success
  end

end
