require 'test_helper'

class RoundUpsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get round_ups_new_url
    assert_response :success
  end

  test "should get create" do
    get round_ups_create_url
    assert_response :success
  end

end
