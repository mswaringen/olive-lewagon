require 'test_helper'

class NgosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ngos_index_url
    assert_response :success
  end

  test "should get show" do
    get ngos_show_url
    assert_response :success
  end

end
