require "test_helper"

class FormattingStyleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get formatting_style_index_url
    assert_response :success
  end

  test "should get show" do
    get formatting_style_show_url
    assert_response :success
  end

  test "should get create" do
    get formatting_style_create_url
    assert_response :success
  end

  test "should get update" do
    get formatting_style_update_url
    assert_response :success
  end

  test "should get destroy" do
    get formatting_style_destroy_url
    assert_response :success
  end
end
