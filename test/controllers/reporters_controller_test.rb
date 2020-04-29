require 'test_helper'

class ReportersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reporters_index_url
    assert_response :success
  end

  test "should get show" do
    get reporters_show_url
    assert_response :success
  end

  test "should get create" do
    get reporters_create_url
    assert_response :success
  end

  test "should get delete" do
    get reporters_delete_url
    assert_response :success
  end

  test "should get update" do
    get reporters_update_url
    assert_response :success
  end

end
