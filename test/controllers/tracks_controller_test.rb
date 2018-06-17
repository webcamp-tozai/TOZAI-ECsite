require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tracks_create_url
    assert_response :success
  end

  test "should get new" do
    get tracks_new_url
    assert_response :success
  end

  test "should get edit" do
    get tracks_edit_url
    assert_response :success
  end

  test "should get update" do
    get tracks_update_url
    assert_response :success
  end

end
