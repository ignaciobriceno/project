require 'test_helper'

class PhotographersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get photographers_show_url
    assert_response :success
  end

  test "should get edit" do
    get photographers_edit_url
    assert_response :success
  end

  test "should get update" do
    get photographers_update_url
    assert_response :success
  end

end
