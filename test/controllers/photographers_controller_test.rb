require 'test_helper'

class PhotographersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photographers_index_url
    assert_response :success
  end

end
