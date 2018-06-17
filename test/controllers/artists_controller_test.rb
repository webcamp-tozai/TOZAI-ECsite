require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get artists_create_url
    assert_response :success
  end

  test "should get new" do
    get artists_new_url
    assert_response :success
  end

  test "should get edit" do
    get artists_edit_url
    assert_response :success
  end

  test "should get update" do
    get artists_update_url
    assert_response :success
  end

end
