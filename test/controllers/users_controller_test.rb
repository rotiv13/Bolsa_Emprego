require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get index_candidate" do
    get index_candidate_url
    assert_response :success
  end

  test "should get index_entitie" do
    get index_entitie_url
    assert_response :success
  end

  test "should get new_candidate" do
    get new_candidate_url
    assert_response :success
  end

  test "should get new_entitie" do
    get new_entitie_path
    assert_response :success
  end

  test "should get show" do
    get user_url
    assert_response :success
  end

end
