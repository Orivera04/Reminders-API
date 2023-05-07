require "test_helper"

class TelegramTriggerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get telegram_trigger_index_url
    assert_response :success
  end

  test "should get show" do
    get telegram_trigger_show_url
    assert_response :success
  end

  test "should get create" do
    get telegram_trigger_create_url
    assert_response :success
  end

  test "should get update" do
    get telegram_trigger_update_url
    assert_response :success
  end

  test "should get destroy" do
    get telegram_trigger_destroy_url
    assert_response :success
  end
end
