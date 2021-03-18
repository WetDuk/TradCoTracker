require "test_helper"

class PointControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get point_index_url
    assert_response :success
  end

  test "should get show" do
    get point_show_url
    assert_response :success
  end

  test "should get new" do
    get point_new_url
    assert_response :success
  end

  test "should get edit" do
    get point_edit_url
    assert_response :success
  end

  test "should get delete" do
    get point_delete_url
    assert_response :success
  end
end
