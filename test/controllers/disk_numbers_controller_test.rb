require 'test_helper'

class DiskNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get disk_numbers_create_url
    assert_response :success
  end

  test "should get new" do
    get disk_numbers_new_url
    assert_response :success
  end

  test "should get edit" do
    get disk_numbers_edit_url
    assert_response :success
  end

  test "should get update" do
    get disk_numbers_update_url
    assert_response :success
  end

end
