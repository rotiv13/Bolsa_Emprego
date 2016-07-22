require 'test_helper'

class NoticiasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get noticias_new_url
    assert_response :success
  end

  test "should get show" do
    get noticias_show_url
    assert_response :success
  end

  test "should get index" do
    get noticias_index_url
    assert_response :success
  end

  test "should get create" do
    get noticias_create_url
    assert_response :success
  end

end
