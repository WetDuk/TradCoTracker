require "test_helper"

class SpeakingPointControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get speaking_point_index_url
    assert_response :success
  end

  test "should get show" do
    get speaking_point_show_url
    assert_response :success
  end

  test "should get new" do
    get speaking_point_new_url
    assert_response :success
  end

  test "should get edit" do
    get speaking_point_edit_url
    assert_response :success
  end

  test "should get delete" do
    get speaking_point_delete_url
    assert_response :success
  end
end
