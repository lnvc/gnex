require 'test_helper'

class AddsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adds_index_url
    assert_response :success
  end

end
