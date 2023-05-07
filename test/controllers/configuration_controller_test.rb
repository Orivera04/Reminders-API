require "test_helper"

class ConfigurationApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get configuration_api_index_url
    assert_response :success
  end

  test "should get show" do
    get configuration_api_show_url
    assert_response :success
  end

  test "should get create" do
    get configuration_api_create_url
    assert_response :success
  end

  test "should get update" do
    get configuration_api_update_url
    assert_response :success
  end

  test "should get destroy" do
    get configuration_api_destroy_url
    assert_response :success
  end
end
