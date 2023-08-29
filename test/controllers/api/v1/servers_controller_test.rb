require "test_helper"

class Api::V1::ServersControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get api_v1_servers_import_url
    assert_response :success
  end
end
